resource "aws_key_pair" "bastion" {
  key_name = "bastion"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINcAB2pnG4yy6ehTeVb5EB2oR639wfTK9c9+CVW7g4p9"
}

resource "aws_key_pair" "app1" {
  key_name = "app"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbdzPgncalqD4IRqPs5ft+m1xifp6rnyKW3t6ZfB7fGp8A2ccmGE7oM2L4dwkCX69lyE+bHISoKrKGBJNiLkxlyASyRQ/z5VYC6ODfdPHn5IUgn7X0rIIve0zwqDkl0f5lkiJVHWsUekroQKVQ2mXTUczDVBPd5DRHt28AWLk3YYkJHGUkFQ/CNTKWx9LoGqOwCoMAZOJW9FjC15etV3vF/OsylgW/Vetgs3wlJjhBhkgXnOuFEC0FJyvUfHychgDWq4Uh8vTyLZwBM5VP4Hk/k91tFM6n+pMztjXyUdIWkpO23TB8VOSi6DvAcyoehQZu9eP75n7BQe8AkIzZGWG3"
}

resource "aws_key_pair" "app2" {
  key_name = "app2"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC7MK0ZGdaRsB4EL1zZLSTMywBthlrv9idz2+b8gnroi"
}
