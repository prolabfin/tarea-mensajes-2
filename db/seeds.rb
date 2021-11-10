# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Crear 5 usuarios
1.upto(5) do |nusuario|
  us = User.new
  us.first_name = "Usuario #{nusuario}"
  us.last_name = "Apellido"
  us.email_address = "correo@gmail.com"
  us.save()
end
# 1er => first_name Usuario 1
# 2do => first_name Usuario 2
# 3er => first_name Usuario 3
# 4er => first_name Usuario 4
# 5er => first_name Usuario 5
puts "N usuarios: #{User.all.count}"
puts "Tarea 10. Hecho"

#Tarea 11. Crear 5 Blogs
1.upto(5) do |nblog|
  b = Blog.new
  b.name = "Blog #{nblog}"
  b.description = "Description"
  b.save()
end
# 1er => Blog 1
# 2do => Blog 2
# 3er => Blog 3
# 4er => Blog 4
# 5er => Blog 5
puts "N Blogs: #{Blog.all.count}"
puts "Tarea 11. Hecho"

#Tarea 12, Usuario 1 tiene 3 blogs

1.upto(3) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 1").first
  ow.blog = Blog.where(name: "Blog #{nblog}").first
  ow.save()
end

puts User.where(first_name: "Usuario 1").first.owner.count
puts "Tarea 12. Hecho."

#Tarea 13
ow = Owner.new
ow.user = User.where(first_name: "Usuario 2").first
ow.blog = Blog.where(name: "Blog 4").first
ow.save()

puts "# de propiedades: #{User.where(first_name: "Usuario 2").first.owner.count}"
## de propiedades: 3

puts "El blog 4 esta asinado #{User
  .where(first_name: "Usuario 2")
  .first.owner
  .where(blog: Blog.where(name: "Blog 4").first)
  .count}"

puts "Tarea 13. Hecho."

#Tarea 14
ow = Owner.new
ow.user = User.where(first_name: "Usuario 5").first
ow.blog = Blog.where(name: "Blog 5").first
ow.save

puts User.where(first_name: "Usuario 5").first.owner.count

puts User.where(first_name: "Usuario 5")
  .first.owner
  .where(blog: Blog.where(name: "Blog 5").first).count

puts "Tarea 14. Hecho."

#Tarea 15, Usuario 3 debe ser dueno de 5 blogs
1.upto(5) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 3").first
  ow.blog = Blog.where(name: "Blog #{nblog}").first
  ow.save
end

puts User.where(first_name: "Usuario 3").first.owner.count

puts User.where(first_name: "Usuario 3").first.owner
  .where(blog: Blog
    .where(name: [
      "Blog 1", "Blog 2", "Blog 3", "Blog 4", "Blog 5"])).count

puts "Tarea 15. Hecho."

#Tarea 16
1.upto(3) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.blog = Blog.where(name: "Blog 2").first
  p.user = User.where(first_name: "Usuario 1").first
  p.save
end

ue = User.where(first_name: "Usuario 1").first
be = Blog.where(name: "Blog 2").first

puts "Posts: #{Post.where(user: ue, blog: be).count}"
puts "Tarea 16. Hecho."

#Tarea 17.
us2 = User.where(first_name: "Usuario 2").first
ulb = Blog.where(name: "Blog 5").first

1.upto(5) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.user = us2
  p.blog = ulb
  p.save
end

puts "Post: #{Post.where(blog: ulb, user: us2).count}"
puts "Tarea 17. Hecho."

#Tarea 18 Haz que el usuario 3 cree varias publicaciones en en diferentes blogs:
#capturar al usuario 3 solo quiero el primero del array que me da where
us3 = User.where(first_name: "Usuario 3").first
#Recorrer ese numero de blog en cada iteracion por cada blog voy creando una nueva publicacion. Al title y al content se le dan valores aleatorios no son tan importantes
Blog.all.each do |t|
  p = Post.new
  p.blog = t
  p.user = us3
  p.title = "Un titulo"
  p.content = "Un contenido cualquiera"
  p.save
end
  # Contar el numero de post qu tiene el usuario 3 
  #User.find(3).Post.count
 puts  us3.post.count

 #TArea 19 Ubicar al 3er usuario, 
 us3 =  User.where(first_name: "Usuario 3").first
 #Crear dos mensajes sobre la  PRIMERA PUBLICACION
 # Ubicar a la primera publicacion
primpublic = Post.all.first
primpublic = Post.all[0]
 # Ubicar a la segunda publicacion
 primpublic = Post.all[0]
 segpublic = Post.all[1]
1.upto(2) do |t|
  m = Message.new
  m.post = primpublic
  m.user = us3
  m.author = "algun author"
  m.message = "aqui va algun mensaje"
end
#Crear 3 mensajes sobre la  SEGUNDA PUBLICACION
1.upto(3) do |t|
  m = Message.new
  m.post = segpublic
  m.user = us3
  m.author = "algun author"
  m.message = "aqui va algun mensaje"
end

# Contar el numero mensajes del usuario 3
 us3.message.count
 puts Message.where(user: us3).count

 #Tarea19 Haz que el usuario 4 cree cree 3 mensajes para la ultima publicacion que tu creaste 

 us4 =  User.where(first_name: "Usuario 4").first
 ultpublic = Post.all.last
 1.upto(3) do |t|
  m = Message.new
  m.post = ultpublic
  m.user = us4
  m.author = "algun author"
  m.message = "aqui va algun mensaje"
end
#contar los mensajes del usuario 4
puts  "Mensajes #{us4.message.count}"
puts  Message.where(user: us4).count

#Tarea 21  Capturar al segundo post en la variable po2  

po2 = Post.all[1]
puts  "Antes => #{po2.user.first_name}"
#captura al ultimo usuario en la variable ulu
ulu = User.all.last
#Actualizar usuario
po2.user = ulu
po2.save
puts "Despues => #{po2.user.first_name}"

#Tarea 22 
po2 = Post.all[1]
po2.content = "un nuevo contenido modificado"
po2.save
puts "Content #{po2.content}"

#Tarea 23
#Obtenga todos los blogs que sean propiedad del Usuario 3
#se relaciona modelo blog con user a traves de owner , extraer los blogs id de owner pluck extrae un campo en especifico de un array owner , trae el id de Blog, o sea se obtiene un array [idblog1, idblog2, ...,idblogn]

us3 = User.find(3)
owners = us3.owner
blog_ids = owners.pluck(:blog_id)
blogs = Blog.where(id: blog_ids)

puts "Blogs del usuario 3: #{blogs}"






