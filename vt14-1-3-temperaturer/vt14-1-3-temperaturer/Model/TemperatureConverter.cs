using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace vt14_1_3_temperaturer.Model
{
    public class TemperatureConverter
    {
        public static int CelsiusToFarenheit(int degreesC)
        {
            return Convert.ToInt32(degreesC * 1.8 + 32);
        }
        public static int FahrenheitToCelsius(int degreesF)
        {
            return Convert.ToInt32((degreesF - 32) * 5 / 9);
        }
    }
}