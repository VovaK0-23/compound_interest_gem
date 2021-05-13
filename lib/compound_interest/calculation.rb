# frozen_string_literal: true

module CompoundInterest
  class Calculation
    def self.calculate(params)
      raise_error(params)

      @initial_payment = params[:initial_payment]
      # number of terms
      @term = params[:term]
      # interest rate per term
      @interest_rate = params[:interest_rate].to_f / 100
      # number of interest payments for the term
      @capitalization_periodicity = params[:capitalization_periodicity]
      @payment = params[:payment] || 0
      # number of payments for the term
      @payment_periodicity = params[:payment_periodicity]

      result
    end

    def self.result
      result = @initial_payment * compound_interest_formula
      result = periodical_payment_calculation if @payment.positive?
      result
    end

    def self.periodical_payment_calculation
      times = (@payment_periodicity * @term).to_i
      payment_result = 0
      (1..times).each do |i|
        payment_result += @payment * compound_interest_formula(i)
      end
      payment_result
    end

    def self.compound_interest_formula(num = 0)
      if num.zero?
        (1.0 + @interest_rate / @capitalization_periodicity)**(@term * @capitalization_periodicity)
      else
        (1.0 + @interest_rate / @capitalization_periodicity)**((@term * @capitalization_periodicity) -
            (@capitalization_periodicity / @payment_periodicity * num))
      end
    end

    def self.raise_error(params)
      raise "Argument must be Hash" if params.class != Hash
      raise ArgumentError, "Argument must include :initial_payment" if params[:initial_payment].nil?
      raise ArgumentError, "Argument must include :term" if params[:term].nil?
      raise ArgumentError, "Argument must include :interest_rate" if params[:interest_rate].nil?
      raise ArgumentError, "Argument must include :capitalization_periodicity" if [:capitalization_periodicity].nil?
    end
  end
end
