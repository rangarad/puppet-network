require 'spec_helper'

describe 'network' do

  let(:facts) {{
    :osfamily => 'RedHat',
  }}

  context 'with defroute => true' do
    let(:params) {{
      :interfaces_hash => {
        'eth10' => {
          'defroute' => true,
        },
      },
    }}
    it do
      should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').
      with_content(/DEFROUTE="yes"/)
    end
  end  

  context 'with defroute => false' do
    let(:params) {{
      :interfaces_hash => {
        'eth10' => {
          'defroute' => false,
        },
      },
    }}
    it do
      should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').
      with_content(/DEFROUTE="no"/)
    end
  end  

  context 'with defroute undefined' do
    let(:params) {{
      :interfaces_hash => {
        'eth10' => {
        },
      },
    }}
    it do
      should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').
      without_content(/DEFROUTE/)
    end
  end
end
