<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password Request</title>
</head>
<body>
    <p>Hello,</p>
    <p>We received a request to reset the password for your BD Funded Trader account.</p>
    <p>To reset your password, please click the button below::</p>
    <p><a href="{{ url('/user/reset-password?email='.$user->email.'&token='.$token) }}" style="display:inline-block;padding:10px 20px;background:#0d6efd;color:#fff;text-decoration:none;border-radius:5px;">
    Reset Password</a></p>
    <!-- <p>🔗https://bdfundedtrader.com/reset-password  Reset Password</p> -->
    <p>If you did not request this, please ignore this message.</p>
    <p>For your security, this link will expire in 5 minutes.</p>
    <br>
    <p>Best regards, <br>{{ config('app.name') }}</p> Support Team
</body>
</html>







