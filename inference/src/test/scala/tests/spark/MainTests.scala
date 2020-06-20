package tests.spark

import org.scalatest.FunSuite

class MainTests extends FunSuite {
  test("Main.foo") {
    assert(Main.foo() == "bar")
  }
}