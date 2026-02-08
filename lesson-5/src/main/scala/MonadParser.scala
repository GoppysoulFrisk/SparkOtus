class MonadParser[T, Src] (private val p: Src => (T, Src)) {
    def flatMap[M] (f: T => MonadParser[M, Src]): MonadParser[M, Src] = 
        MonadParser{ src =>
            val (word, rest) = p(src)
            val mn = f(word)
            val res = mn.p(rest)
            res
        }

    def map[M](f: T=>M): MonadParser[M, Src] =
        MonadParser{src =>
            val (word, rest) = p(src)
            (f(word), rest)
        }

    def parse(src: Src): T = p(src)._1
}

object MonadParser {
        def apply[T, Src](f: Src=> (T, Src)) = new MonadParser[T, Src](f)
}

object TestExecutor {
    def main(args: Array[String]): Unit = {
        val str = "Nastya;23;52.2;true"

        def StringField: MonadParser[String, String] = MonadParser[String, String] {
            str => 
                val idx = str.indexOf(";")
                if(idx > -1)
                    (str.substring(0, idx), str.substring(idx+1))
                else 
                    (str, "")
        }

        def IntField: MonadParser[Int, String] = StringField.map(_.toInt)   
        def DoubleField: MonadParser[Double, String] = StringField.map(_.toDouble)   
        def BooleanField: MonadParser[Boolean, String] = StringField.map(_.toBoolean) 

        val parser = for {
            name <- StringField
            age <- IntField
            weight <- DoubleField
            isStudent <- BooleanField
        } yield Person(name, age, weight, isStudent)

        val result: Array[Person] = str.split("\n").map(parser.parse)

        result

    }

    
}