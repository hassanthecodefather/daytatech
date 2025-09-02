public with sharing class MathUtils {
    
    public class DivideResult {
        public Decimal value   { get; set; }
        public String message   { get; set; }
    }

    public static DivideResult divide(Decimal a, Decimal b) {
        DivideResult result = new DivideResult();
        if (a == null) {
            result.message = 'Input a cannot be null.';
            return result;
        }
        if (b == null) {
            result.message = 'Input b cannot be null.';
            return result;
        }
        if (b == 0) {
            result.message = 'Division by zero is not allowed.';
            return result;
        }
        try {
            Decimal quotient = a.divide(b, 9); 
            result.value = quotient.setScale(9, RoundingMode.HALF_UP);
        } catch (Exception e) {
            result.message = 'Unexpected calculation error: ' + e.getMessage();
        }

        return result;
    }
}
