# gokrazy-kernel-buggy-linux-7_0

This is a gokrazy kernel package containing a Linux 7.0 amd64 kernel for
Tailscale natlab/vmtest. It intentionally preserves the UDP GSO regression from
tailscale/tailscale#19777 so tests can exercise mitigation behavior even when
the host kernel is fixed.

The checked-in kernel image is:

```text
./vmlinuz
```

It is bootable as a gokrazy amd64 kernel under QEMU `q35` and includes the
drivers needed by the vmtest image, including PCI, virtio block, and the Intel
`igb` network driver. The diagnostic vmtest checks that the guest `igb`
interface advertises `tx-udp-segmentation` and `tx-gso-partial` before using it
for mitigation tests.

In a Tailscale checkout, use this as a gokrazy `KernelPackage`:

```text
github.com/tailscale/gokrazy-kernel-buggy-linux-7_0
```

For local development before a module version is published, use a `go.mod`
replace:

```text
replace github.com/tailscale/gokrazy-kernel-buggy-linux-7_0 => ../github.com/tailscale/gokrazy-kernel-buggy-linux-7_0
```

To rebuild the kernel locally:

```sh
./build-buggy-linux-7_0.bash
```

The build script downloads and unpacks Linux 7.0 into this directory. The
downloaded tarball and unpacked source tree are ignored by git.
