using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vt14_1_3_temperaturer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            StartTempTextBox.Focus();
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var startTemp = int.Parse(StartTempTextBox.Text);
                var stopTemp = int.Parse(StopTempTextBox.Text);
                var tempDifference = int.Parse(TempDifferenceTextBox.Text);
               
                //StartTempTextBox.Text = "Det funkade!";
                if (RadioButton1.Checked == true)
                {
                    RenderHeader("C", "F");
                    TabelCelciusToFarenheit(startTemp, stopTemp, tempDifference);
                }
                else
                {
                    RenderHeader("F", "C");
                    TabelFarenheitToCelsius(startTemp, stopTemp, tempDifference);
                }
                if (sendButton.Text == "Konvertera")
                {
                    sendButton.Text = "Rensa";
                    
                }
                else
                {
                    sendButton.Text = "Konvertera";
                    StartTempTextBox.Text = "";
                    StopTempTextBox.Text = "";
                    TempDifferenceTextBox.Text = "";
                    TempPresentationPanel.Visible = false;
                }
            }
        }
        private void TabelCelciusToFarenheit(int startTemp, int stopTemp, int tempDifference)
        {
            for (var celsius = startTemp; celsius <= stopTemp; celsius += tempDifference)
            {
                var farenheit = Model.TemperatureConverter.CelsiusToFarenheit(celsius);
                CreateAndAddRow(celsius, farenheit);
            }
        }
        private void TabelFarenheitToCelsius(int startTemp, int stopTemp, int tempDifference)
        {
            for (var farenheit = startTemp; farenheit <= stopTemp; farenheit += tempDifference)
            {
                var celsius = Model.TemperatureConverter.FahrenheitToCelsius(farenheit);
                CreateAndAddRow(farenheit, celsius);
            }
        }
        private void CreateAndAddRow(int left, int right)
        {
            TableRow tRow = new TableRow();
            Table1.Rows.Add(tRow);

            TableCell cell1 = new TableCell();
            tRow.Cells.Add(cell1);
            cell1.Text = left.ToString();

            TableCell cell2 = new TableCell();
            tRow.Cells.Add(cell2);

            cell2.Text = right.ToString();
        }
        private void RenderHeader(string firstColumn, string secondColumn)
        {
            TableHeaderRow header = new TableHeaderRow();
            Table1.Rows.Add(header);
            header.Attributes.Add("class", "tableHeader");

            TableCell headerCell1 = new TableCell();
            header.Cells.Add(headerCell1);
            headerCell1.Text = firstColumn;
            TableCell headerCell2 = new TableCell();
            header.Cells.Add(headerCell2);
            headerCell2.Text = secondColumn;
        }
    }
    //TableHeaderRow header = new TableHeaderRow();
    //Table1.Rows.Add(header);


    //TableCell headerCell1 = new TableCell();
    //header.Cells.Add(headerCell1);
    //headerCell1.Text = "F";
    //TableCell headerCell2 = new TableCell();
    //header.Cells.Add(headerCell2);
    //headerCell2.Text = "C";

}