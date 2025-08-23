<!DOCTYPE html>
<html>
<head>
    <title>New Contact Form Submission</title>
</head>
<body>
    <h2>New Contact Form Details</h2>
    <p><strong>Full Name:</strong> {{ $data->first_name }} {{ $data->last_name }}</p>
    <p><strong>Email:</strong> {{ $data->email }}</p>
    <p><strong>Phone Number:</strong> {{ $data->phone_number }}</p>
    <p><strong>Address:</strong> {{ $data->address }}</p>
    <p><strong>Description:</strong> {{ $data->description }}</p>
</body>
</html>