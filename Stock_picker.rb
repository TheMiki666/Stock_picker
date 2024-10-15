#Constants
NUM_ELEMENTS = 10 #Elements of the random matrix; num of days in this exercise
MAX_RANDOM_NUMBER=100   #Maximum value of a random number; max price in this exercise

def create_random_matrix (num_elements)
    matrix=[]
    num_elements.times{ matrix.push(rand(MAX_RANDOM_NUMBER)+1)}
    matrix
end

#Returns a matrix of hashes; each hash contains a possible combination of buying day, selling day and benefits (or losses)
def create_matrix_of_benefits (prices)
    matrix=[]
    for buy_day in 0..prices.length-1 do
        for sell_day in buy_day+1..prices.length-1 do
            matrix.push({
                buy_day:    buy_day,
                sell_day:   sell_day,
                benefits:   prices[sell_day]-prices[buy_day]
            })
            
        end
    end
    matrix
end

def find_max_benefit(benefits_matrix)
    return {} if benefits_matrix.empty?
    chosen_element=benefits_matrix[0]
    maximum=chosen_element[:benefits]
    for i in 1..benefits_matrix.length-1 do
        if benefits_matrix[i][:benefits] >maximum 
            chosen_element=benefits_matrix[i]
            maximum=benefits_matrix[i][:benefits]
        end
    end
    chosen_element
end

def present_results (operation, diary_prices)
    if operation[:benefits].nil? || operation[:benefits]<=0
        puts "There is no profit in this operation any day"
    else
        puts "This is the better operation:"
        puts "Buy at the day #{operation[:buy_day]} at the price of #{diary_prices[operation[:buy_day]]}$"
        puts "Sell at the day #{operation[:sell_day]} at the price of #{diary_prices[operation[:sell_day]]}$"
        puts "The benefit will be #{operation[:benefits]}$ per action"
    end
end


def main_program 
    prices=create_random_matrix (NUM_ELEMENTS)
    string = "Diary prices: #{prices}"
    puts string
    benefits=create_matrix_of_benefits(prices)
    chosen_operation=find_max_benefit(benefits)
    present_results(chosen_operation, prices)
    
end


main_program