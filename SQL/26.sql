SELECT        i.InvoiceNumber, i.InvoiceDate, i.InvoiceTotal, i.PaymentTotal, i.CreditTotal, i.InvoiceTotal - i.PaymentTotal - i.CreditTotal AS BalanceDue, v.VendorName, v.VendorCity, v.VendorState, t.TermsDescription, t.TermsDueDays
FROM            dbo.Invoices AS i INNER JOIN
                         dbo.Vendors AS v ON i.VendorID = v.VendorID INNER JOIN
                         dbo.Terms AS t ON t.TermsID = i.TermsID
WHERE        (i.InvoiceTotal - i.PaymentTotal - i.CreditTotal > 0) AND (v.VendorState = 'TN')