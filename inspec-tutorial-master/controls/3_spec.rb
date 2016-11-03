control "cis-1-5-1" do
	impact 1.0
	title "Set User/Group Owner on /boot/grub2/grub.cfg (Scored)"
	desc "Set the owner and group of /boot/grub2/grub.cfg to the root user."
	describe file("/boot/grub2/grub.cfg") do
		its('owner') { should eq 'root' }
	end
	describe file('/boot/grub2/grub.cfg') do
		its('group') { should eq 'root' }
	end
end

