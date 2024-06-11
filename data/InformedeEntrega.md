# Informe de Finalización de Prueba Técnica

## Tareas de Ruby on Rails

### Configuración del Proyecto

- Se creó una nueva aplicación Rails llamada BlogApp.
- Se configuró la base de datos para utilizar PostgreSQL.
- Se agregó la gema pry-rails al grupo de desarrollo y prueba.

### Modelos y Migraciones

- Se creó un modelo Post con los siguientes atributos: title (string), body (text), published_at (datetime).
- Se creó un modelo Comment con los siguientes atributos: content (text), post_id (integer).
- Se estableció la relación de que un Post tiene muchos Comments, y un Comment pertenece a un Post.

### Controladores y Rutas

- Se creó un controlador PostsController con acciones estándar (index, show, new, create, edit, update, destroy).
- Se configuraron las rutas para soportar todas las acciones CRUD para Post.
- Se implementó la acción index para mostrar todos los posts.

### Vistas y Formularios

- Se creó una vista para la acción index que lista todos los posts con sus títulos y fechas de publicación.
- Se creó una vista para la acción new con un formulario para crear un nuevo post.
- Se aseguró de que el formulario incluyera campos para title, body, y published_at.

### Autenticación

- Se implementó una autenticación básica utilizando el gem devise.
- Se restringió la creación, edición o eliminación de posts solo a usuarios autenticados.

## Tareas de AWS

### Lanzar y Configurar una Instancia EC2

- Se configuró AWS CLI.
- Se creó un par de claves.
- Se creó un Security Group y se autorizó el acceso SSH.
- Se lanzó una instancia EC2.

Para verificar y acceder a la instancia EC2 es requerido el archivo **blogapp.pem**

```
$ ssh -i PATH/blogapp.pem ubuntu@ec2-54-91-255-3.compute-1.amazonaws.com
```

### Subir y Gestionar Archivos en S3

#### Se creó un bucket S3.
```
$ aws s3 mb s3://my-bucket-jun-11-2024
```
#### Se subió un archivo.
```
$ aws s3 cp data/PruebaRubyAndAWS.pdf s3://my-bucket-jun-11-2024
```
#### Se generó una URL firmada.
```
$ aws s3 presign s3://my-bucket-jun-11-2024/PruebaRubyAndAWS.pdf --expires-in 4800000
```

Para abrir el archivo de la -> [URL Firmada](https://my-bucket-jun-11-2024.s3.amazonaws.com/PruebaRubyAndAWS.pdf?AWSAccessKeyId=AKIAYRS2DQJJ575N4ZML&Signature=0MNM%2BJLzr%2BIkj69Nt1ZblI7XIqA%3D&Expires=1722900812)

### Configuración Básica de RDS

- #### Crear un grupo de seguridad:
```
$ aws ec2 create-security-group --group-name MySQLSecurityGroup --description "Security group for MySQL access"
```

- #### Autorizar el tráfico entrante: 

```
$ aws ec2 authorize-security-group-ingress --group-name MySQLSecurityGroup --protocol tcp --port 3306 --cidr 0.0.0.0/0
```

- #### Crear una instancia RDS MySQL:

```
$ aws rds create-db-instance \
  --db-instance-identifier mydbinstance \
  --db-instance-class db.t3.micro \
  --engine mysql \
  --allocated-storage 20 \
  --master-username admin \
  --master-user-password [MYSQL_PASSWORD] \
  --vpc-security-group-ids [MYSQL_GROUP_ID] \
  --availability-zone us-east-1a \
  --db-name mydatabase \
  --publicly-accessible \
  --backup-retention-period 7 \
  --engine-version 8.0
```


- #### Se verificó que la instancia RDS esté en ejecución.

La contraseña se encuentra en el archivo keys.txt enviado via email.

```
$ mysql -h mydbinstance.cvmqeqcuyf3z.us-east-1.rds.amazonaws.com -P 3306 -u admin -p
```

### Implementar un Load Balancer con Auto Scaling

- Se creó un Launch Configuration.

```
$ aws autoscaling create-launch-configuration \
  --launch-configuration-name my-launch-config \
  --image-id [AMI ID] \
  --instance-type t2.micro \
  --key-name [KEY_PAIR_NAME] \
  --security-groups [AUTOSCALLING_SECURITY_G] 
```

- Se creó un grupo de Auto Scaling.
```
aws autoscaling create-auto-scaling-group \
  --auto-scaling-group-name my-auto-scaling-group \
  --launch-configuration-name my-launch-config \
  --min-size 1 \
  --max-size 1 \
  --desired-capacity 1 \
  --vpc-zone-identifier [SUBNET_ID]
```

- Se creó un Target Group.
```
aws elbv2 create-target-group \
  --name my-target-group \
  --protocol HTTP \
  --port 80 \
  --vpc-id [VPC_ID]

```
- Se registraron instancias en el Target Group.
```
aws elbv2 register-targets \
  --target-group-arn [TARGET_GROUP_ARN] \
  --targets Id=[INSTANCE_ID]
```
- Se creó una política de Auto Scaling.

## Resumen

Se han completado con éxito todas las tareas según los requisitos de la prueba técnica. El proyecto Ruby on Rails está completamente funcional, incluyendo modelos con relaciones, autenticación y operaciones básicas CRUD. Además, se han completado las tareas de AWS, demostrando competencia en el lanzamiento y gestión de recursos en la nube.

## Notas Generales

- Este documento usa algunas keys que por temas de seguridad, solo se envían através de email.

- En el proceso de deployment se intentó hacer deployment usando Nginx + Passenger, lastimosamente al parece este último es incompatible con la última versión de ubuntu y presentó dificultades en el proceso de deployment. Ahora mismo está en ejecución bajo una instancia screen con el servidor propio de rails (NO en producción)

- Si eres un desarrollador que te interesa poner en ejecución el proyecto RoR todo lo necesario para ello lo encontrarás en el archivo README.md en la raíz del proyecto.