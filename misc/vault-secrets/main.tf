module "create-secrets" {
  for_each = var.secrets
  source   = "./create-secrets"
  kv_path  = each.key
  secrets  = each.value
}

variable "secrets" {
  default = {
    infra = {
      ssh = {
        admin_username = "koushik",
        admin_password = "Koushik@123456"
      }
    }
    roboshop-dev = {
      frontend = {
        catalogue_endpoint = "http://catalogue-dev.azdevops.shop:8080"
        cart_endpoint      = "http://cart-dev.azdevops.shop:8080"
        user_endpoint      = "http://user-dev.azdevops.shop:8080"
        payment_endpoint   = "http://payment-dev.azdevops.shop:8080"
        shipping_endpoint  = "http://shipping-dev.azdevops.shop:8080"
        # CATALOGUE_HOST     = "catalogue-dev.azdevops.shop"
        # CATALOGUE_PORT     = "8080"
        # USER_HOST          = "user-dev.azdevops.shop"
        # USER_PORT          = "8080"
        # CART_HOST          = "cart-dev.azdevops.shop"
        # CART_PORT          = "8080"
        # SHIPPING_HOST      = "shipping-dev.azdevops.shop"
        # SHIPPING_PORT      = "8080"
        # PAYMENT_HOST       = "payment-dev.azdevops.shop"
        # PAYMENT_PORT       = "8080"

      }
      catalogue = {
        MONGO       = "true"
        MONGO_URL   = "mongodb://mongodb-dev.azdevops.shop:27017/catalogue"
      #   DB_TYPE     = "mongo"
      #   APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
      #   DB_HOST     = "mongodb-dev.azdevops.shop"
      #   SCHEMA_FILE = "db/master-data.js"
      }
      user = {
        MONGO     = "true"
        REDIS_URL = "redis://redis-dev.azdevops.shop:6379"
        MONGO_URL = "mongodb://mongodb-dev.azdevops.shop:27017/users"
      }
      cart = {
        REDIS_HOST     = "redis-dev.azdevops.shop"
        CATALOGUE_HOST = "catalogue-dev.azdevops.shop"
        CATALOGUE_PORT = "8080"
      }
      shipping = {
        CART_ENDPOINT = "cart-dev.azdevops.shop:8080"
        DB_HOST       = "mysql-dev.azdevops.shop"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
        DB_HOST       = "mysql-dev.azdevops.shop"
        DB_USER       = "root"
        DB_PASS       = "RoboShop@1"
      }
      payment = {
        CART_HOST = "cart-dev.azdevops.shop"
        CART_PORT = "8080"
        USER_HOST = "user-dev.azdevops.shop"
        USER_PORT = "8080"
        AMQP_HOST = "rabbitmq-dev.azdevops.shop"
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
      mysql = {
        MYSQL_ROOT_PASSWORD = "RoboShop@1"
      }
      rabbitmq = {
        AMQP_USER = "roboshop"
        AMQP_PASS = "roboshop123"
      }
    }
  }
}