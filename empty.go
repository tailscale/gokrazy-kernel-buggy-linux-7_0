// Copyright (c) Tailscale Inc & contributors
// SPDX-License-Identifier: BSD-3-Clause

// Package kernel exists so gokrazy can select this module as a KernelPackage.
//
// This module packages a Linux 7.0 vmlinuz that contains the UDP GSO bug from
// tailscale/tailscale#19777 for natlab/vmtest.
package kernel
