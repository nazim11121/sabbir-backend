<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Stripe Pricing Table</title>
</head>
  <body>
      <script async src="https://js.stripe.com/v3/pricing-table.js"></script>
      <stripe-pricing-table 
        pricing-table-id="prctbl_1QkOPMJJiZUvCRXLmAOb2wRe"
        publishable-key="pk_test_51QUrQEJJiZUvCRXLGLWnVfMADaEj3IA3TCbMtXft5DKDC1nb7ft6G2LbRYXFkpIq09LFLYNN80Lx8UlQ22qh4Yk000nqp6Alsf"
        success-url="https://118.179.149.162:8812/creed/api/business-info/payment-success?session_id={CHECKOUT_SESSION_ID}"
        cancel-url="https://118.179.149.162:8812/creed/api/business-info/payment-cancel">
      </stripe-pricing-table>
  </body>
</html>
