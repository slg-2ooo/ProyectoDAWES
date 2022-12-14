<?php

namespace Sergiolg\Dawes\features;

use PHPMailer\PHPMailer;

class Mailer {

    static function sendMail($email){

        $remitente = "Sergio LG";
        $asunto = 'Su cuenta ha sido creada';
        $enlaceActivacionCuenta = "http://" . $_SERVER['HTTP_HOST'] . "/activar-cuenta";
        $mensaje = <<<EOD
<p>La creacion de su cuenta se a realizado con exito</p>
<p>
Puede activarla pulsando el siguiente enlace:
<a href="$enlaceActivacionCuenta">Activar cuenta</a>
</p>
<p>Atentamente $remitente</p>
EOD;


        $mail = new PHPMailer\PHPMailer();

        $mail->isSMTP();                        // Utilizar SMTP
        $mail->Host       = 'smtp.gmail.com';    // Servidor SMTP
        $mail->SMTPAuth   = true;               // Autenticacion SMTP
        $mail->Username   = 'proyectodawes@gmail.com';     // Usuario SMTP
        $mail->Password   = 'elvtzchdckrgqxkr';         // Password SMTP
        $mail->SMTPSecure = 'ssl';              // encriptado tls o ssl
        $mail->Port       = 465;                // Puerto smtp

        $mail->setFrom('proyectodawes@gmail.com', $remitente);           // Correo y nombre del remitente
        $mail->addAddress($email);           // Correo del destinatario

        $mail->isHTML(true);                                  
        $mail->Subject = $asunto;
        $mail->Body = $mensaje;

        $mail->send();

        return $mail;

    }


}