# resource "kubernetes_ingress_v1" "ingress" {
#   depends_on = [kubernetes_service.svc]
#   metadata {
#     name      = var.ingress_name
#     namespace = kubernetes_namespace.namespace.metadata[0].name

#   }

#   spec {

#     default_backend {
#       service {
#         name = var.svc_name
#         port {
#           number = 8080
#         }
#       }
#     }
#     rule {
#       http {
#         path {
#           backend {
#             service {
#               name = var.svc_name
#               port {
#                 number = 8080
#               }
#             }
#           }

#           path = "/"
#         }

#       }
#     }

#     tls {
#       secret_name = var.secret_name
#     }
#   }
# }
