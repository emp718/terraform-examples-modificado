# *** YOUR CODE HERE ***
# Crear un recurso google_storage_bucket para almacenar imágenes en Google Storage
resource "google_storage_bucket" "static-site" {
  name          = "image-store.com"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://image-store.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}
# Crear en el bucket anteior dos recursos google_storage_bucket_object
# (uno para cada imagen de la carpeta ./images)
# Configurar la propiedad source desde la raíz del proyecto (./images/<imagen.jpg>)
resource "google_storage_bucket_object" "picture" {
  name   = "butterfly01"
  source = "./images/<imagen1.jpg>"
  bucket = "image-store"
}
resource "google_storage_bucket_object" "picture" {
  name   = "butterfly02"
  source = "./images/<imagen2.jpg>"
  bucket = "image-store"
}
# Definir una regla de acceso para objeto creado de forma que sea público 
# Configurar google_storage_object_access_control así
#   role   = "READER"
#   entity = "allUsers"
resource "google_storage_object_access_control" "public_rule" {
  object = google_storage_bucket_object.object.output_name
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket" {
  name     = "static-content-bucket"
  location = "US"
}

resource "google_storage_bucket_object" "object" {
  name   = "public-object"
  bucket = google_storage_bucket.bucket.name
  source = "../static/img/header-logo.png"
}
# **********************  
