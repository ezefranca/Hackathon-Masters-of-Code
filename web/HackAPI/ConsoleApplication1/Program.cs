using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using SimplifyCommerce.Payments;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            //PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            //PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            //PaymentsApi api = new PaymentsApi();
            //Customer customer = new Customer();
            //Card card = new Card();
            //card.Cvc = "123";
            //card.ExpMonth = 11;
            //card.ExpYear = 19;
            //card.Number = "5555555555554444";
            //customer.Card = card;
            //customer.Email = "customer@mastercard.com";
            //customer.Name = "Customer Customer";
            //customer.Reference = "Ref1";
            //try
            //{
            //    customer = (Customer)api.Create(customer);
            //}
            //catch (Exception e)
            //{
            //    Console.WriteLine(e.ToString());
            //}
            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
            CardToken cardToken = new CardToken();
            Card card = new Card();
            card.AddressCity = "OFallon";
            card.AddressState = "MO";
            card.Cvc = "123";
            card.ExpMonth = 11;
            card.ExpYear = 19;
            card.Number = "5105105105105100";
            cardToken.Card = card;
            try
            {
                cardToken = (CardToken)api.Create(cardToken);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }

               String id = "1234";
    CardToken cardToken2 = (CardToken)api.Find(typeof(CardToken), id);
    // output all properties
    Console.WriteLine(JsonConvert.SerializeObject(cardToken2).ToString());



        }
    }
}
