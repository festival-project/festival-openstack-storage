#
# Cookbook Name:: festival-openstack-storage
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'mkfs.ext4 /dev/vdb' do
  command '/sbin/mkfs.ext4 /dev/vdb'
  not_if {File.exists?(node.combined_default['festival-openstack-storage']['mount_point'])}
end

directory node.combined_default['festival-openstack-storage']['mount_point'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

mount node.combined_default['festival-openstack-storage']['mount_point'] do
  device node.combined_default['festival-openstack-storage']['device']
  fstype node.combined_default['festival-openstack-storage']['fstype']
  mount_point node.combined_default['festival-openstack-storage']['mount_point']
  action [:enable, :mount]
end
