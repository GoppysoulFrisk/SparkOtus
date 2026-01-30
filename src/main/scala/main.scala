object main extends App {
    // Task1.task1()

    case class Person(name: String, age: Int, weight: Double, isStudent: Boolean)

    val positive = List("yes", "да", "true")
    val negative = List("no", "нет", "false")

    def isStudent(io: String): Boolean = positive.contains(io) || negative.contains(io)

// Создайте переменные следующих типов:
// Строку (String) для хранения имени.
    val name: String = "Anastasia"
// Целое число (Int) для хранения возраста.
    val age: Int = 23
// Дробное число (Doube) для хранения веса.
    val weight: Double = 52.2
// Логическое значение (Boolean) для хранения статуса (студент или не студент).
    val isStudent: Boolean = true

    val anastasia = Person(name, age, weight, isStudent)

// Выведите значения всех переменных на экран с помощью функции println.
    println(anastasia)
    println(s"name: $name")
    println(s"age: $age")
    println(s"weight: $weight")
    println(s"isStudent: $isStudent")

// Напишите функцию, которая принимает два целых числа и возвращает их сумму.
    val sum = (x: Int, y: Int) => {x + y}
// 3.1. Вызовите эту функцию с любыми двумя числами и выведите результат на экран.
    val sumResult = sum(3, 7)
    println(s"sum: $sumResult")

// Напишите функцию, которая принимает возраст и возвращает строку "Молодой", если возраст меньше 30, и "Взрослый", если возраст 30 или больше.
    def ageCategory(age: Int): String = if (age < 30) "young " else "adult"
// 4.1. Вызовите эту функцию с вашей переменной возраста и выведите результат на экран.
    println(s"age category: ${ageCategory(age)}")

// Напишите цикл, который выводит на экран числа от 1 до 10.
    println("numbers from 1 to 10:")
    for (i <- 1 to 10) {
      println(i)
    }
// 5.1. Создайте список имен студентов и выведите каждое имя на экран с помощью цикла.
    val students = List("Anna", "Maria", "Danya", "Katen'ka")
    println("Students names:")
    for (student <- students) {
      println(student)
    }

// Напишите программу, которая выполняет следующие действия:
// Запрашивает у пользователя ввод имени, возраста и статуса (студент или нет).
    println(s"enter name:")
    val ioName = scala.io.StdIn.readLine().trim
    println(s"enter age:")
    val ioAge = scala.io.StdIn.readLine().trim.toInt
    println(s"You are a student?")
    val ioIsStudent = isStudent(scala.io.StdIn.readLine().trim.toLowerCase())

// Использует написанные выше функции и выводит на экран информацию о пользователе и его возрастную категорию.

    println(Person(ioName, ioAge, 0.0, ioIsStudent))
    
// Изучить и научиться использовать for comprehension в языке программирования Scala для работы с коллекциями и опциями.

// Создайте список чисел от 1 до 10.
    val numbers: List[Int] = List.range(1, 11)
// Используйте for comprehension, чтобы создать новый список, содержащий квадраты чисел из исходного списка.
    val squares = for (n <- numbers) yield n * n
    println(s"squares of numbers: $squares")
// Используйте for comprehension, чтобы создать новый список, содержащий только четные числа из исходного списка.
    val evens = for (n <- numbers if n % 2 == 0) yield n
    println(s"evens numbers: $evens")
  
}