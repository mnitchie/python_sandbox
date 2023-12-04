import boto3

ec2 = boto3.client('ec2')

try:
    security_groups = ec2.describe_security_groups()
    for sg in security_groups['SecurityGroups']:
        print(f"Security Group ID: {sg['GroupId']}, Name: {sg['GroupName']}")
        print("Inbound Rules:")
        for permission in sg['IpPermissions']:
            print(f"  Protocol: {permission.get('IpProtocol', 'N/A')}")
            for ip_range in permission.get('IpRanges', []):
                print(f"    IP Range: {ip_range.get('CidrIp', 'N/A')}")
            for ipv6_range in permission.get('Ipv6Ranges', []):
                print(f"    IPv6 Range: {ipv6_range.get('CidrIpv6', 'N/A')}")
            for user_id_group_pair in permission.get('UserIdGroupPairs', []):
                print(f"    Security Group: {user_id_group_pair.get('GroupId', 'N/A')}")
        print("\n")
except Exception as e:
    print(f"An error occurred: {e}")
