import scala.io.StdIn.readLine

// Напишите программу на Scala, которая принимает имя пользователя с клавиатуры и выводит приветственное сообщение.

object Greeting {
    def run(): Unit = {
        println("\n Задача 1: Приветствие ")
        println("Как звать?:")
        val name = readLine()
        println(s"Привет, $name!")
    }
}

// Напишите функцию, которая принимает два целых числа и возвращает их сумму.

object Sum {
    val sum: (Int, Int) => Int = (a, b) => a + b
    
    def run(): Unit = {
        println("\n Задача 2: Сумма ")
        println("Требуется ввести числа через пробел:")
        val numbers = readLine().split(" ").map(_.toInt)
        val result = sum(numbers(0), numbers(1))
        println(s"Сумма ${numbers(0)} + ${numbers(1)} = $result")
    }
}

// Создайте список из нескольких чисел (например, List(1, 2, 3, 4, 5)) и примените к нему функцию, которая увеличивает каждое число на 1. Выведите получившийся список на экран.

object ListIncrement {
    val increment = (x: Int) => x + 1
    
    def run(): Unit = {
        println("\n Задача 3: Увеличение списка ")
        println("Для создания спискаребуется ввести числа через пробел:")
        val numbers = readLine().split(" ").map(_.toInt)
        val incremented = numbers.map(increment)
        println(s"Исходный список: ${numbers.mkString(", ")}")
        println(s"После инкремента: ${incremented.mkString(", ")}")
    }
}

// Напишите программу, которая принимает число с клавиатуры и выводит, является ли оно четным или нечетным.

object OddOrNot {
    def checkOddOrNot(number: Int): String = {
        if (number % 2 == 0) "четное" else "нечетное"
    }
    
    def run(): Unit = {
        println("\n Задача 4: Проверка четности ")
        println("Введи число:")
        val number = readLine().toInt
        val result = checkOddOrNot(number)
        println(s"Число ${number} это ${result}")
    }
}



// Создайте программу, которая принимает строку и выводит её длину.

object StringLength {
    def getLength(str: String): Int = str.length
    
    def run(): Unit = {
        println("\n Задача 5: Длина строки ")
        println("Введи строку:")
        val str = readLine()
        val length = getLength(str)
        println(s"Длина строки: $length")
    }
}

// Напишите функцию, которая принимает список строк и возвращает новую строку, состоящую из всех строк списка, разделенных пробелами.

object JoinStrings {
    
    def run(): Unit = {
        println("\n Задача 6: Объединение строк ")
        println("Введи слова через пробел:")
        val strings = readLine().split(" ").toList
        println("Введи символы, которые я использую, что бы объединить это в строку:")
        val separator = readLine()

        val joinStrings: List[String] => String = (strings) => strings.mkString(separator)

        val result = joinStrings(strings)
        println(s"Исходный список: ${strings.mkString(", ")}")
        println(s"Объединено: ${result}")
    }
}

