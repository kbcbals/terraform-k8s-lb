resource "null_resource" "flannel" {
  count = var.flannel_enabled ? 1 : 0

  connection {
    host        = hcloud_server.master.0.ipv4_address
    private_key = file(var.ssh_private_key)
  }

  provisioner "remote-exec" {
    inline = ["kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml"]
  }

  depends_on = [hcloud_server.master]
}

