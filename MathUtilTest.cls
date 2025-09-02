@IsTest
private class MathUtilsTest {
    @IsTest
    static void testHappyPath() {
        MathUtils.DivideResult res = MathUtils.divide(10, 2);
        System.assertEquals(5, res.value);
    }
    @IsTest
    static void testDivideByZero() {
        MathUtils.DivideResult res = MathUtils.divide(10, 0);
        System.assertEquals('DIVIDE_BY_ZERO', res.errorCode);
    }
    @IsTest
    static void testNullA() {
        MathUtils.DivideResult res = MathUtils.divide(null, 5);
        System.assertEquals('Input a cannot be null.', res.message);
    }
    @IsTest
    static void testNullB() {
        MathUtils.DivideResult res = MathUtils.divide(5, null);
        System.assertEquals('Input b cannot be null.', res.message);
    }
    @IsTest
    static void testPrecisionRounding() {
        MathUtils.DivideResult res = MathUtils.divide(1, 3);
        System.assertEquals(0.333333333, res.value); 
    }
    @IsTest
    static void testLargeNumbers() {
        Decimal a = 12345678901234567890.123456789;
        Decimal b = 987654321.123456789;
        MathUtils.DivideResult res = MathUtils.divide(a, b);
        System.assertNotEquals(null, res.value);
    }
}
