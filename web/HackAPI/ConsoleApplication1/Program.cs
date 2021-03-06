﻿using System;
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
            // PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            // PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            //PaymentsApi api = new PaymentsApi();
            //CardToken cardToken = new CardToken();
            //Card card = new Card();
            //card.AddressCity = "OFallon";
            //card.AddressState = "MO";
            //card.Cvc = "123";
            //card.ExpMonth = 11;
            //card.ExpYear = 19;
            //card.Number = "5105105105105100";
            //cardToken.Card = card;
            //try
            //{
            //    cardToken = (CardToken)api.Create(cardToken);
            //}
            //catch (Exception e)
            //{
            //    Console.WriteLine(e.ToString());
            //}

            //String id = "1234";
            //CardToken cardToken2 = (CardToken)api.Find(typeof(CardToken), id);
            //// output all properties
            //Console.WriteLine(JsonConvert.SerializeObject(cardToken2).ToString());



            //PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            //PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            //PaymentsApi api = new PaymentsApi();
            //Invoice invoice = new Invoice();
            //invoice.Currency = "USD";
            //invoice.Email = "customer@mastercard.com";
            //List<InvoiceItem> items = new List<InvoiceItem>();
            //InvoiceItem items1 = new InvoiceItem();
            //items1.Amount = 4302;
            //items1.Quantity = 1;
            //// items1.Tax = new Tax("[TAX ID]");
            //items.Add(items1);
            //invoice.Items = items;
            //invoice.Memo = "This is a memo";
            //invoice.Name = "Customer Customer";
            //invoice.Note = "This is a note";
            //invoice.Reference = "Ref2";
            //invoice.SuppliedDate = 2394839384000;
            //try
            //{
            //    invoice = (Invoice)api.Create(invoice);
            //}
            //catch (Exception e)
            //{
            //    Console.WriteLine(e.ToString());
            //}




            PaymentsApi.PublicApiKey = "sbpb_NjQ5MGEzN2ItMjUyZS00N2NjLWFlOTAtY2E4ZDRkN2MzNGQ1";
            PaymentsApi.PrivateApiKey = "MQ10w7l+OHsdsspzkDVcQToP2n5GVs83iM5c2aLydqR5YFFQL0ODSXAOkNtXTToq";

            PaymentsApi api = new PaymentsApi();
            Payment payment = new Payment();
            payment.Amount = 4302;
            payment.Currency = "USD";
            payment.Description = "payment description";
            payment.Reference = "7a6ef6be3221";
            payment.Token = "25e3c7c3-5cbc-469d-9e45-b99a4fe65824";
            payment.Invoice = "bbXEoj4K";
            try
            {
                payment = (Payment)api.Create(payment);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.ToString());
            }


        }
    }
}
