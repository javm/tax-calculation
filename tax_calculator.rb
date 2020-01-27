def percentage(n, portion)
  x = (n * portion) / 100
end

def tax_amount(income,
               upper_bounds,
               brackets,
               above)

  portion = above
   
  upper_bounds.each do |b|
    if income < b
      portion = brackets[b.to_i.to_s.to_sym]
      break
    end
  end

  return percentage(income, portion)

end


# Configurations examples
tax_brackets = {

  '10000': 0,
  '20000': 10,
  '50000': 20
}
above = 30

#Input: incomes
incomes = [60000, 800, 15000, 3000, 20001.5]

#Input brackets
upper_bounds = tax_brackets.keys.map { |b| b.to_s.to_f } 
upper_bounds = upper_bounds.sort()


incomes.each do |i|
  p = tax_amount(i, upper_bounds, tax_brackets, above)
  puts("#{i} #{p}")
end
