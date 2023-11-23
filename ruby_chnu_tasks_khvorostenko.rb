#1.1 Дано цілочисельний масив. Необхідно вивести спочатку його елементи з парними індексами, а потім - з непарними.

def even_odd_elements(arr)
    even_elements = arr.select.with_index { |_, index| index.even? }
    odd_elements = arr.select.with_index { |_, index| index.odd? }
  
    puts "(1) Елементи з парними індексами: #{even_elements.join(', ')}"
    puts "(1) Елементи з непарними індексами: #{odd_elements.join(', ')}"
end

  my_array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  even_odd_elements(my_array)


#1.2 Дано цілочисельний масив. Вивести номер останнього з тих його елементів, які задовольняють подвійній нерівності: A[0] < A[i] < A[-1]. Якщо таких елементів немає, то вивести [ ].
def find_elements(arr)
    result = arr.each_with_index.select do |el, i|
      el > arr[0] && el < arr[-1]
    end
  
    if result.empty?
      puts "[]"
    else
      last_index = result.last[1]
      puts "(2) Номер останнього елемента, який задовольняє подвійній нерівності: #{last_index}"
    end
end

  my_array = [1, 3, 5, 4, 8, 2, 9]
  find_elements(my_array)
  

#1.3 Дано цілочисельний масив. Перетворити його, додавши до непарних чисел останній елемент. Перший і останній елементи масиву не змінювати.
def transform_array(arr)
    return arr if arr.length <= 2
  
    last_element = arr[-1]
  
    transformed_array = arr.map.with_index do |el, i|
      if i != 0 && i != arr.length - 1 && el.odd?
        el + last_element
      else
        el
      end
    end
  
    transformed_array
end
  
  my_array = [1, 2, 3, 7, 5]
  result_array = transform_array(my_array)
  print "(3) "
  puts result_array.join(', ')


#1.4 Дано цілочисельний масив. Замінити всі додатні елементи на значення максимального.
def replace_positive_with_max(arr)
    return [] if arr.empty?
  
    max_value = arr.max
  
    replaced_array = arr.map do |el|
      el.positive? ? max_value : el
    end
  
    replaced_array
end
  
  my_array = [3, -2, 7, 1, -5, 9, 0]
  result_array = replace_positive_with_max(my_array)
  print "(4) "
  puts result_array.join(', ')


#1.5 Дано цілочисельний масив. Здійснити циклічний зсув елементів масиву вліво на одну позицію.
def rotate_left(arr)
    return arr if arr.empty?
  
    first_element = arr.shift
    arr.push(first_element)
end
  
  my_array = [1, 2, 3, 4, 5]
  rotated_array = rotate_left(my_array)
  print "(5) "
  puts rotated_array.join(', ')

  
#1.6 Дано цілочисельний масив. Перевірити, чи утворюють елементи геометричну прогресію. Якщо так, то вивести знаменник прогресії, якщо ні - вивести nil.
def geometric_progression_ratio(arr)
    return nil if arr.length < 3
  
    ratio = arr[1] / arr[0].to_f  # Знаменник геометричної прогресії
  
    arr.each_with_index do |el, i|
      next if i == 0
  
      expected_value = arr[i - 1] * ratio
  
      return nil if el != expected_value
    end
  
    ratio
end
  
  my_array = [2, 4, 8, 16]
  result_ratio = geometric_progression_ratio(my_array)
  
  if result_ratio.nil?
    puts "(6) Елементи не утворюють геометричну прогресію."
  else
    puts "(6) Знаменник геометричної прогресії: #{result_ratio}"
  end

  
#1.7 Дано цілочисельний масив. Знайти максимальний з його локальних максимумів.
def find_local_maxima(arr)
    local_maxima = []
  
    arr.each_with_index do |el, i|
      prev = arr[i - 1]
      next_el = arr[i + 1]
  
      if (prev.nil? || el > prev) && (next_el.nil? || el > next_el)
        local_maxima << el
      end
    end
  
    max_local_maxima = local_maxima.max
end
  
  my_array = [1, 3, 7, 1, 2, 9, 5, 8, 4]
  result_max = find_local_maxima(my_array)
  
  if result_max.nil?
    puts "(7) Локальних максимумів не знайдено."
  else
    puts "(7) Максимальний з локальних максимумів: #{result_max}"
  end

  
#1.8 Дано цілочисельний масив. Визначити кількість ділянок, на яких його елементи монотонно спадають.
def count_decreasing_ranges(arr)
    return 0 if arr.empty?
  
    decreasing_ranges = 0
    current_range = 1  # Початкова ділянка
  
    (1...arr.length).each do |i|
      if arr[i] < arr[i - 1]
        current_range += 1
      else
        decreasing_ranges += 1 if current_range > 1
        current_range = 1
      end
    end
  
    decreasing_ranges += 1 if current_range > 1  # Перевірка для останньої ділянки
  
    decreasing_ranges
end
  
  my_array = [5, 4, 3, 7, 6, 5, 2, 1]
  result_count = count_decreasing_ranges(my_array)
  
  puts "(8) Кількість ділянок, на яких елементи монотонно спадають: #{result_count}"

  
#1.9 Дано цілочисельний масив. Перетворити його, вставивши перед кожним додатним елементом нульовий елемент.
def insert_zero_before_positive(arr)
    transformed_array = []
  
    arr.each do |el|
      if el.positive?
        transformed_array << 0
      end
  
      transformed_array << el
    end
  
    transformed_array
end
  
  my_array = [1, 2, -3, 4, -5, 6]
  result_array = insert_zero_before_positive(my_array)
  print "(9) "
  puts result_array.join(', ')

  
#1.10 Дано цілочисельний масив. Перетворити його, вставивши після кожного від'ємного елемента нульовий елемент.
def insert_zero_after_negative(arr)
    transformed_array = []
  
    arr.each do |el|
      transformed_array << el
      transformed_array << 0 if el.negative?
    end
  
    transformed_array
end
  
  my_array = [1, -2, 3, -4, 5]
  result_array = insert_zero_after_negative(my_array)
  print "(10) "
  puts result_array.join(', ')

  
#1.11 Дано цілочисельний масив. Вивести індекси масиву в тому порядку, в якому відповідні їм елементи утворюють спадну послідовність.
def descending_indices(arr)
    indices = (0...arr.length).to_a
    sorted_indices = indices.sort_by { |index| -arr[index] }
  
    puts "(11) Індекси у порядку спадання відповідних елементів:"
    print "(11) "
    puts sorted_indices.join(', ')
  end
  
  my_array = [5, 3, 8, 2, 7]
  descending_indices(my_array)

  
#1.12 Дано цілочисельний масив. Знайти індекс максимального елемента.
def find_index_of_max_element(arr)
    return nil if arr.empty?
  
    max_index = arr.index(arr.max)
end
  
  my_array = [3, 7, 1, 9, 4, 6]
  result_index = find_index_of_max_element(my_array)
  
  if result_index.nil?
    puts "(12) Масив порожній."
  else
    puts "(12) Індекс максимального елемента: #{result_index}"
  end

  
#1.13 Дано цілочисельний масив. Знайти індекс останнього мінімального елемента.
def find_index_of_last_min_element(arr)
    return nil if arr.empty?
  
    min_value = arr.min
    last_min_index = arr.rindex(min_value)
end
  
  my_array = [3, 1, 7, 1, 9, 1, 4, 6]
  result_index = find_index_of_last_min_element(my_array)
  
  if result_index.nil?
    puts "(13) Масив порожній."
  else
    puts "(13) Індекс останнього мінімального елемента: #{result_index}"
  end

  
#1.14 Дано цілочисельний масив. Знайти кількість максимальних елементів.
def count_max_elements(arr)
    return 0 if arr.empty?
  
    max_value = arr.max
    count_max = arr.count(max_value)
end
  
  my_array = [3, 7, 1, 9, 7, 4, 9, 7]
  result_count = count_max_elements(my_array)
  
  puts "(14) Кількість максимальних елементів: #{result_count}"

  
#1.15 Дано цілочисельний масив. Знайти максимальний парний елемент.
def find_max_even_element(arr)
    even_elements = arr.select { |el| el.even? }
  
    if even_elements.empty?
      puts "(15) У масиві немає парних елементів."
      return nil
    end
  
    max_even_element = even_elements.max
end
  
  my_array = [3, 7, 1, 15, 4, 6, 2, 12]
  result_max_even = find_max_even_element(my_array)
  
  if result_max_even.nil?
    puts "(15) Не вдалося знайти максимальний парний елемент."
  else
    puts "(15) Максимальний парний елемент: #{result_max_even}"
  end


#2 Базовий калькулятор. Створіть просту програму на Ruby, яка виконує основні арифметичні дії, такі як додавання, віднімання, множення та ділення. 
def calculator(num1, num2, operation)
   case operation
    when '+'
     result = num1 + num2
      puts "(2) Результат додавання: #{result}"
    when '-'
      result = num1 - num2
      puts "(2) Результат віднімання: #{result}"
    when '*'
      result = num1 * num2
      puts "(2) Результат множення: #{result}"
    when '/'
      if num2 != 0
        result = num1 / num2.to_f
        puts "(2) Результат ділення: #{result}"
      else
        puts "(2) Помилка: Ділення на нуль."
      end
    else
      puts "(2) Невідома операція."
    end
end
  
  puts "(2) Введіть перше число:"
  num1 = gets.chomp.to_f
  
  puts "(2) Введіть друге число:"
  num2 = gets.chomp.to_f
  
  puts "(2) Введіть операцію (+, -, *, /):"
  operation = gets.chomp.downcase
  
  calculator(num1, num2, operation)

#3. Потрібно знайти коректний Gem, який допоможе імплементувати наступний функціонал
#3.1 Сценарій: Необхідно запланувати регулярні фонові завдання, такі як відправлення щотижневих електронних листів або генерація звітів опівночі.
#Gem: sidekiq
#3.2 Ваш веб-додаток потребує безпечного управління завантаженням файлів, включаючи зображення та документи, і можливо зберігати їх у хмарному сервісі.
#Gem: carrierwave
#3.3 Ваш веб-сайт містить розділ з великою кількістю статей, наприклад, блог або новинний портал. З часом кількість статей зросла до сотень або навіть тисяч, і відвідувачам сайту стає важко знайти потрібну інформацію. Вам потрібен ефективний спосіб організувати показ цих статей, щоб користувачі могли легко переглядати їх, не загрузнувши у великій кількості контенту на одній сторінці. 
#Gem: kaminari
