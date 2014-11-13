require "spec_helper"

describe 'network::interface' do

  let(:title) { 'eth10' }
  let(:facts) {{ :osfamily => 'RedHat' }}

  context 'OS => RedHat, ifcfg => eth10' do
    let(:params) {{
       'defroute'  =>  true,
    }}

    describe 'Test network::interface on RedHat' do
      it 'should populate the ifcfg file with defroute=yes' do
        should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').with_content(/DEFROUTE=\"yes\"/)
      end
    end
  end

  context 'OS => RedHat, ifcfg => eth10' do
    let(:params) {{
      'defroute'  =>  false,
    }}

    describe 'Test network::interface on RedHat' do
      it 'should populate the ifcfg file with defroute=no' do
        should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').with_content(/DEFROUTE=\"no\"/)
      end
    end
  end

  context 'OS => RedHat, ifcfg => eth10' do
    let(:params) {{ }}

    describe 'Test network::interface on RedHat' do
      it 'should populate the ifcfg file with no defroute' do
        should contain_file('/etc/sysconfig/network-scripts/ifcfg-eth10').without(['DEFROUTE'])
      end
    end
  end
end
