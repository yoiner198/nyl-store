# NYL STORE

#### Yoander Gutierrez

#### Sebastian Carrillo

#### Yoiner Martinez

#### Instrucciones para ejecutar el proyecto

- Instalar xampp
  ~~~
  https://www.apachefriends.org/es/download.html
  ~~~
- Clonar nuestro repositorio dentro del disco local - la carpeta llamada xampp - clonamos en htdocs
  ~~~
  https://github.com/yoiner198/nyl-store.git
  ~~~

- Instalar Composer, descargamos el ejecutable del siguiente link:
~~~
https://getcomposer.org/Composer-Setup.exe
~~~  

- Instalar PHPMailer

  Esto lo hacemos ejecunando el siguiente comando dentro de la ruta en donde guardamos el proyecto
~~~
composer install
~~~

- Abrir la aplicacion de xampp e iniciar los servicios de Apache y MySql
- Ingresar a phpmyadmin
~~~
http://localhost/phpmyadmin
~~~
- En la seccion izquierda de phpmyadmin cliquear en "New" para crear una base de datos
- Para un corecto funcionamiento, como nombre para la base de datos es indispensable colocarle el siguiente nombre
~~~
nyl-store
~~~

  Luego de asignar el nombre ya podremos crear la base de datos vacia.
- Como paso siguiente, identificaremos en la barra de herramientas superior de phpmyadmin un apartado que dice "Import" en el que entraremos.
- Cliqueamos en "Seleccionar archivo"
- Nos vamos a la ruta del proyecto que clonamos, entramos a una carpeta llamada "BD" y seleccionamos el unico archivo que encontramos.
- Estando de nuevo en el apartado de Import y habiendo seleccionado nuestra basede datos, ya podemos scrollear hasta abajo en ese apartado y darle a "Import", con eso habremos importado la base de datos y ya podremos ejecutar el proyecto sin problemas.

-- Para ejecutar el proyecto como usuario normal, en la barra de nuestro navegador de preferncia escribimos lo siguiente
~~~
http://localhost/nyl-store
~~~
-- Para loguearnos lo haremos asi:
~~~
correo: yoandering@gmail.com
pass: 123
~~~
-- Para ingresar como administrador entramos aquí:
~~~
http://localhost/nyl-store/admin
~~~
las credenciales son las mismas que en el login anterior

-- Para realizar un pago por PayPal en la apliacacion las credenciales son las siguientes:
~~~
correo: sb-j6jdb7896999@personal.example.com
pass: e8O2lR-I
~~~
