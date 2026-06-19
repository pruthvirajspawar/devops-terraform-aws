resource "aws_instance" "web_server" {
  ami                    = "ami-0e38835daf6b8a2b9"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = "Shree"

  user_data = <<-EOF
#!/bin/bash

dnf update -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html << 'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>Pruthviraj Pawar | AWS & DevOps Engineer</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background:#f4f6f9;
            margin:0;
            padding:0;
        }

        header{
            background:#232f3e;
            color:white;
            text-align:center;
            padding:40px;
        }

        .container{
            width:80%;
            margin:auto;
            padding:20px;
        }

        .card{
            background:white;
            padding:20px;
            margin-top:20px;
            border-radius:10px;
            box-shadow:0px 2px 5px rgba(0,0,0,0.2);
        }

        h2{
            color:#232f3e;
        }

        .skills span{
            display:inline-block;
            background:#232f3e;
            color:white;
            padding:8px 12px;
            margin:5px;
            border-radius:15px;
        }

        footer{
            text-align:center;
            background:#232f3e;
            color:white;
            padding:15px;
            margin-top:20px;
        }
    </style>
</head>
<body>

<header>
    <h1>Pruthviraj Pawar</h1>
    <p>AWS & DevOps Engineer</p>
</header>

<div class="container">

    <div class="card">
        <h2>About Me</h2>
        <p>
            Final Year B.Tech Student passionate about AWS, DevOps,
            Terraform, Linux, Docker and Cloud Computing.
        </p>
    </div>

    <div class="card">
        <h2>Skills</h2>
        <div class="skills">
            <span>AWS</span>
            <span>Terraform</span>
            <span>Linux</span>
            <span>Docker</span>
            <span>Jenkins</span>
            <span>Git</span>
            <span>CI/CD</span>
        </div>
    </div>

    <div class="card">
        <h2>Projects</h2>
        <ul>
            <li>Serverless Student Management System</li>
            <li>EC2 Nginx Deployment using Terraform</li>
            <li>AWS VPC Implementation</li>
            <li>Infrastructure Automation</li>
        </ul>
    </div>

</div>

<footer>
    Hosted on AWS EC2 using Nginx & Terraform 🚀
</footer>

</body>
</html>
HTML

systemctl restart nginx
EOF

  tags = {
    Name = "Web-Server"
  }
}