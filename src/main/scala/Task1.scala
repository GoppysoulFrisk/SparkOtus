object Task1 {
  def task1(): Unit = {
    var running = true
    while (running) {
        Thread.sleep(500)
        println("\n\nВыбери задачу:")
        println("1. Приветствие")
        println("2. Сумма чисел")
        println("3. Увеличение списка на 1")
        println("4. Проверка четности")
        println("5. Длина строки")
        println("6. Объединение строк")
        println("7. Выход")
        
        try {
            val choice = scala.io.StdIn.readLine().trim.toInt
            
            choice match {
                case 1 => Greeting.run()
                case 2 => Sum.run()
                case 3 => ListIncrement.run()
                case 4 => OddOrNot.run()
                case 5 => StringLength.run()
                case 6 => JoinStrings.run()
                case 7 => {
                    println("\n Выход из программы")
                    running = false
                }
                case _ => println("Введите число от 1 до 7")
            }
        } catch {
            case e: NumberFormatException => 
                println("Введите корректное число")
            case e: Exception => 
                println(s"Ошибка: ${e.getMessage}")
        }
    }
    }
}
