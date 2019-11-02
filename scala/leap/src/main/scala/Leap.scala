object Leap {
  def divisibleBy(dividend: Int, divisor: Int): Boolean = dividend % divisor == 0

  def leapYear(year: Int): Boolean = {
    year match {
      case year if divisibleBy(year, 400) => true
      case year if divisibleBy(year, 100) => false
      case year if divisibleBy(year, 4) => true
      case _ => false
    }
  }
}
