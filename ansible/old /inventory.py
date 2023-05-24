#!/usr/bin/python3

import json
import argparse
from yandex_cloud_client import ComputeClient

folder_id = "b1g021" # set folder_id


with open('~/key.json', 'r') as infile:
    credentials = json.load(infile)
compute = ComputeClient(service_account_key=credentials)

parser = argparse.ArgumentParser()
parser.add_argument("--list", help="print list host", action="store_true")
args = parser.parse_args()



class ddjson:
    def __init__(self):
        self.ddjson = {"_meta": {}}
        self.children = ['ungrouped']
        self.vm_name = None
        self.vm_tags = None
        self.vm_ip = None
        self.hostvars = {}

    def show_instance(self, folder_id):
        instance = compute.instances_in_folder(folder_id)
        for count in instance:
            # print(count)
            self.vm_name = count.name
            self.vm_tags = count.labels['tags']
            self.vm_ip = count.network_interfaces[0].primary_v4_address.one_to_one_nat.address
            # print('vm_name:', self.vm_name)
            # print('vm_tags:', self.vm_tags)
            # print('vm_ip:', self.vm_ip)
            self.hostvars[self.vm_name] =  {'ansible_host': self.vm_ip}
            self.children.append(self.vm_tags)
            self.ddjson[self.vm_tags] = {'hosts': self.vm_name}

        self.ddjson['_meta']['hostvars']= self.hostvars
        self.ddjson['all'] = { 'children': self.children}
        return self.ddjson
        print(json.dumps(self.ddjson))



if args.list:
    print(json.dumps(ddjson().show_instance(folder_id)))
