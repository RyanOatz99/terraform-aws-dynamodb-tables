require 'spec_helper'

Aws.use_bundled_cert!

describe dynamodb_table('DTTTable1') do
  it { should exist }
  it { should have_attribute_definition('ItemKey').attribute_type('S') }
  its('provisioned_throughput.read_capacity_units') { should eq(1) }
  its('provisioned_throughput.write_capacity_units') { should eq(1) }
end

describe dynamodb_table('DTTTable2') do
  it { should exist }
  it { should have_attribute_definition('ItemKey').attribute_type('S') }
  its('provisioned_throughput.read_capacity_units') { should eq(2) }
  its('provisioned_throughput.write_capacity_units') { should eq(2) }
end