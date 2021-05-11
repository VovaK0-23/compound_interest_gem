module CompoundInterest
  class Calculation
    def self.calculate(params)
      raise "Argument must be Hash" if params.class != Hash
      if params[:initial_payment].nil?
        raise ArgumentError, "Argument must include :initial_payment"
      elsif params[:term].nil?
        raise ArgumentError, "Argument must include :term"
      elsif params[:interest_rate].nil?
        raise ArgumentError, "Argument must include :interest_rate"
      elsif [:capitalization_periodicity].nil?
        raise ArgumentError, "Argument must include :capitalization_periodicity"
      end

      initial_payment = params[:initial_payment]
      # number of terms
      term = params[:term]
      # ineterest rate per term
      interest_rate = params[:interest_rate].to_f / 100
      # number of interest payments for the term
      capitalization_periodicity = params[:capitalization_periodicity]
      payment = params[:payment] || 0
      # number of payments for the term
      payment_periodicity = params[:payment_periodicity]

      calculation = (1.0 + interest_rate / capitalization_periodicity)**(term * capitalization_periodicity)
      result = initial_payment * calculation
      if payment > 0
        times = (payment_periodicity * term).to_i
        payment_result = 0
        (1..times).each do |i|
          payment_result += payment * calculation - ((capitalization_periodicity / payment_periodicity) * i)
        end
        result = result + payment_result - payment
      end
      result
    end
  end
end
