import UIKit
/*
1.  For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1. (81-1-1-81)

Example #2: An input of 765 will/should return 493625 because 72 is 49, 62 is 36, and 52 is 25. (49-36-25)

Note: The function accepts an integer and returns an integer.

*/
 
func squareDigits(_ num: Int) -> Int {
  let strNum = String(num)
    var result = strNum.compactMap { Int("\($0)") }.map {"\($0 * $0)"}.joined()
    
  return Int(result) ?? 0
}

func squareDigits1(_ num: Int) -> Int {
    var a = num
    var result = ""
    while a > 0 {
        var remainder = a % 10
        result += String(remainder * remainder)
        a /= 10
    }
    return Int(result) ?? 0
}
squareDigits(8187)

/*
 2. Единственное или множественное число?

 Создайте функцию, которая принимает строку в качестве входных данных. Если строка заканчивается на "-s", тогда строка должна вернуть TRUE, чтобы указать, что слово во множественном числе. В противном случае он должен вернуть FALSE. Имейте в виду, что функция должна возвращать логическое значение (ИСТИНА или ЛОЖЬ), а не строковое значение ("истина" или "ложь").

 */

func plural(_ str: String) -> Bool {
    str[str.index(before: str.endIndex)] == "s" ? true : false
}

plural("Cats")


/*
3. Перевернуть строку

Придумайте функцию, которая принимает входную строку и меняет ее порядок. Например, «Я люблю Codecademy!» должен вернуть "!ymedacedoC evol I."

Чтобы усложнить задачу, измените заглавные буквы, чтобы каждое новое слово было заглавным. Итак, «Я люблю Codecademy» выводится как «Ymedacedoc Evol I».
 
 */
func reversed(_ str: String) -> String {
    var result = str.reversed()
    return String(result)
}

reversed("Hello")

func reversed2(_ str: String) -> String {
     var reverse = ""
    for i in str {
        var strValue = "\(i)"
        reverse = strValue + reverse
    }
    
    return reverse.capitalized
}
reversed2("Hello")
/*
4. Изограммы

Изограмма – это слово, в котором нет повторяющихся букв. Например, «сегодня» — это изограмма, а «завтра» — нет. Создайте функцию, которая принимает входную строку и возвращает ИСТИНА, если слово является изограммой, и ЛОЖЬ, если это не так.

В качестве дополнительной задачи, если слово является изограммой, выведите повторяющуюся букву или буквы вместо вывода ИСТИНА. Таким образом, ввод «завтра» выведет [«o», «r»].
 */

func isRepeat(_ str: String) -> Bool {
    var checkedSymb = [Character]()
    for symb in str {
        if checkedSymb.contains(symb) {
            return false
        }
        checkedSymb.append(symb)
    }
    return true
}

isRepeat("Hello")
isRepeat("cat")


func isRepeat2(_ str: String) -> Bool {
    Set(str).count == str.count
}

isRepeat2("sar")
/*
5. Найдите палиндром

Возможно, вы помните, что палиндром — это слово, которое пишется одинаково в обе стороны — например, «мама» или «гоночная машина». Создайте функцию, которая принимает строку в качестве входных данных и возвращает TRUE, если строка является палиндромом.

В качестве дополнительной задачи найдите способ проверить, является ли фраза или предложение палиндромом, например, «Taco Cat» или «Жаль, что я спрятал ботинок». Вам придется найти способ удалить пробелы в ваших фразах, чтобы функция работала.
*/
func isPalindrom(_ str: String) -> Bool {
    var reverse = ""
    var lowercased = str.lowercased().filter{ ($0 == " ") }
    for i in lowercased {
        var strValue = "\(i)"
        reverse = strValue + reverse
        }
        
    return reverse == lowercased
    }
isPalindrom("А роза упала на лапу Азора")

//second solution
func isPalindrom2(_ str: String) -> Bool {
    
    let lowercased = str.lowercased().filter{ ($0 == " ") }
    return String(lowercased.reversed()) == lowercased
}
isPalindrom2("А роза упала на лапу Азора")


/*
 6. Написать функцию, которая принимает 2 строки и возвращает true, если эти строки содержат одни и те же символы в любом порядке с учетом регистра.
 */

func isIdentical(str1: String, str2: String) -> Bool {
    var flag = false
    for i in str1 {
        if str2.contains(i) && str1.count == str2.count {
            flag = true
        }
    }
    return flag
}
    
    isIdentical(str1: "Helllo", str2: "lohle")

//second solution
func isIdentical2(str1: String, str2: String) -> Bool {
    var checkString = str2
    for i in str1 {
        if let index = checkString.firstIndex(of: i) {
            checkString.remove(at: index)
        }
    }
    return checkString.count == 0
}
    
    isIdentical2(str1: "Helllo", str2: "lohle")

// third solution
func isIdentical3(str1: String, str2: String) -> Bool {
    str1.sorted() == str2.sorted()
}
isIdentical3(str1: "Hello", str2: "loHle")
/*
 7. написать функцию, которая принимает одну строку и возвращает true если эта строка полностью в другой строке, игнорируя регистр.
 
 */
func contain(str1: String, str2: String) -> Bool {
    str2.lowercased().contains(str1.lowercased())
}
contain(str1: "Lov", str2: "Hello")
//запишем как расширение
let str = "Hello R"
extension String {
    func customContains(str: String) -> Bool {
        self.lowercased().contains(str.lowercased())
    }
}
    str.customContains(str: "oll")
    

/*
 8. Сколько раз символ встречается в строке. Написать функцию, которая возвращает количество раз, которое данный символ встречается в строке c учетом регистра.
 */

func howManyChar(str: String, char: Character) -> Int {
    var counter = 0
    for i in str {
        if i == char {
            counter += 1
        }
    }
    return counter
}

howManyChar(str: "Hello, I love watermelon", char: "l")

// second solution

func howManyChar2(str: String, char: Character) -> Int {
    str.filter { $0 == char }.count
}
howManyChar2(str: "Hello, I love watermelon", char: " ")

// thirdSolution

func howManyChar3(str: String, char: Character) -> Int {
    str.reduce(0) {$1 == char ? $0 + 1 : $0 }
}
howManyChar3(str: "Hello, I love watermelon", char: "l")




/*
 9. Удаление повторяющихся символов
 
 Написать функцию, которая принимает строку как свой единственный вариант и возвращает ту же строку только с удаленными повторяющимися символами
 */
func duplicates(str: String) -> String {
    var testChar = [Character]()
    for i in str {
        if !testChar.contains(i){
            testChar.append(i)
        }
    }
        return String(testChar)
}

duplicates(str: "Hello")

/*
 10. Сокращение количества пробелов до одного
 Написать функцию, которая принимает строку как единственный параметр и возвращает ту же самую строку только с замененными множественными пробелами.
 */

func noSpaces(str: String) -> String {
    let space: Character = " "
    var newStr = ""
    var flag = false
    
    for i in str {
        if i == space {
            if flag { continue }
            flag = true
        } else {
            flag = false
        }
        newStr.append(i)
    }
    return newStr
}

noSpaces(str: "Hello     Swift   🖖🏼")

    /*
     11. Врвщение строки.
     Написать функцию, которая принимает 2 строки и возвращает true, если одна является вращением другой, с учетом регистра.
    
     */
func rotation(str: String, strRotated: String) -> Bool {
    guard str.count == strRotated.count else { return false }
    let combined = str + str
    return combined.contains(strRotated)
}

rotation(str: "Hello", strRotated: "lloHel")

/*
 11. Является ли строка панграммой. Написать функцию, которая принимает строку и возвращает true, если эта строка является панраммой (Игнорируя регистр).
 */

func pangrammEng(str: String) -> Bool {

    let strSet = Set(str.lowercased())
    let check = strSet.filter { $0 >= "a" && $0 <= "z" }
    return check.count == 26
}
pangrammEng(str: "The quick brown fox jumps over the lazy dog")

func pangrammRus(str: String) -> Bool {

    let strSet = Set(str.lowercased())
    let check = strSet.filter { $0 >= "а" && $0 <= "я" }
    print(check)
    return check.count == 32
}

pangrammRus(str: "Эх, чужд кайф, сплющь объём вши, грызя цент")

/*
 12. Количество гласных и согласных
 
 Написать функцию, которая принимает строку и возвращает tuple, содержащий число гласных и согласных букв в данной строке.
 */

func vowelsAndConsonants(str: String) -> (Int, Int) {
    var vowelsCount = 0
    var consonantsCount = 0
    
    for i in str.lowercased() {
        switch i {
        case "a", "e", "i", "o", "u":
            vowelsCount += 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonantsCount += 1
        default: break
        }
    }
    return (vowelsCount, consonantsCount)
}
vowelsAndConsonants(str: "kkk")


func vowelsAndConsonants2(str: String) -> (Int, Int) {
    let vowels = "aeiou"
    let consonants = "bcdfghjklmnpqrstvwxyz"
    
    var vowelsCount = 0
    var consonantsCount = 0
    
    for i in str.lowercased() {
        if vowels.contains(i) {
            vowelsCount += 1
        } else if consonants.contains(i) {
            consonantsCount += 1
        }
    }
    return (vowelsCount, consonantsCount)
}
vowelsAndConsonants2(str: "jju")
 /*
13. Карточки с именами

Представьте, что вы создаете визитки для группы иностранных гостей. Их имена и страны проживания можно хранить в словаре в виде пар ключ-значение:

guests = [ “Mike” : “Canada”, “Jane” : “Australia”, “Angela” : “Germany”, “Robert” : “Nigeria”]

Создайте функцию, которая принимает имя в качестве входной строки и выводит приветствие визитной карточки, включающее имя человека и страну. Например, «Я [имя] и я из [страны]». Таким образом, ввод имени Роберта приведет к выводу: «Я Роберт, и я из Нигерии».

Если имени нет в словаре, вывод должен включать только имя человека.

Ищете новый вызов? Если имени человека еще нет в словаре, отобразите сообщение вроде «Обнаружено новое имя. Пожалуйста, введите страну» и предложите пользователю ввести название страны. Затем имя и страна должны быть добавлены в существующий словарь. Подсказка: используйте readLine(), чтобы принять пользовательский ввод.

6. Факторный вызов

Помните факториалы из средней школы? Факториал "!" оператор означает, что вы должны умножить число на все целые числа, которые стоят перед числом. Итак, 4! равно 4 х 3 х 2 х 1, или 24.

Создайте функцию, которая принимает целое число в качестве входных данных и вычисляет факториал этого числа. Если число равно 4, то на выходе должно быть 24.

Ищете больше проблем? Попробуйте проверить ввод пользователя. Если число меньше нуля, отобразите сообщение «Ввод не может быть отрицательным». Если на входе 0, то на выходе должно быть 1.

7. По возрастанию

Создайте функцию, которая выводит числа в положительном числовом входе в порядке возрастания. Например, ввод 9462 должен вывести 2469.

Чтобы усложнить себе задачу, добавьте в функцию аргумент, который принимает строки «по возрастанию» или «по убыванию». В зависимости от ввода этого аргумента ваша функция должна сортировать массив либо по возрастанию, либо по убыванию.

8. Есть ли большее число?

Для заданного массива и числа n создайте функцию, которая возвращает ИСТИНА, если число в массиве больше n. Например, для массива [24, 32, 42, 34] и n = 50 вывод должен быть ЛОЖЬ.

Для дополнительной задачи, если в массиве есть несколько чисел выше n, верните массив из более высоких чисел в порядке возрастания. Итак, для массива [24, 32, 42, 34] и n = 27 вывод должен быть [32, 34, 42].

9. Четы и шансы

Создайте функцию, которая разбивает входной массив на два массива — один только с четными числами, а другой только с нечетными числами. Например, ввод [3, 45, 9, 80, 1, 306] выведет [[80, 306], [3, 45, 9, 1]].

Чтобы усложнить упражнение, добавьте в функцию дополнительный аргумент n. Числа, делящиеся на n, помещаются в первый выходной массив, а все остальные числа — во второй выходной массив. Например, для входного массива [3, 5, 18, 10] и n = 3 выходной массив должен быть [[3, 18], [5, 10]].

10. Фильтр длины цифр

Для данного входного массива и числа n создайте функцию, которая выводит только числа с n цифрами. Таким образом, ввод [34, 29, 99, 434, 1, 3] и n = 2 должен выводить только [34, 29, 99].

Для дополнительной задачи создайте функцию, которая отфильтровывает числа с заданным количеством знаков после запятой.
*/


/*
 
 */
