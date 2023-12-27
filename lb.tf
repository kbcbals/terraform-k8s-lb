resource "hcloud_load_balancer" "kube_load_balancer" {
   name       = "kube-lb"
   load_balancer_type = var.lb_type
   location   = var.location
}
resource "hcloud_load_balancer_service" "kube_load_balancer_service" {
   load_balancer_id = hcloud_load_balancer.kube_load_balancer.id
   protocol = "tcp"
   listen_port = 6443
   destination_port = 6443
}
resource "hcloud_load_balancer_target" "load_balancer_target" {
  count       = var.master_count
  depends_on  = [hcloud_server.master]
  type = "server"
  server_id = hcloud_server.master[count.index].id
  load_balancer_id = hcloud_load_balancer.kube_load_balancer.id
}