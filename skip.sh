# Create User
echo -e "${BLUE}Checking user existence${NC}"
dscl_path="$dataVolumePath/private/var/db/dslocal/nodes/Default"
localUserDirPath="/Local/Default/Users"
defaultUID="501"
if ! dscl -f "$dscl_path" localhost -list "$localUserDirPath" UniqueID | grep -q "\<$defaultUID\>"; then
	echo -e "${CYAN}Create a new user / Tạo User mới${NC}"
	echo -e "${CYAN}Press Enter to continue, Note: Leaving it blank will default to the automatic user / Nhấn Enter để tiếp tục, Lưu ý: có thể không điền sẽ tự động nhận User mặc định${NC}"
	echo -e "${CYAN}Enter Full Name (Default: Apple) / Nhập tên User (Mặc định: Apple)${NC}"
	read -rp "Full name: " fullName
	fullName="${fullName:=Apple}"

	echo -e "${CYAN}Nhận Username${NC} ${RED}WRITE WITHOUT SPACES / VIẾT LIỀN KHÔNG DẤU${NC} ${GREEN}(Mặc định: Apple)${NC}"
	read -rp "Username: " username
	username="${username:=Apple}"

	echo -e "${CYAN}Enter the User Password (default: 4 space) / Nhập mật khẩu (mặc định: 4 dấu cách)${NC}"
	read -rsp "Password: " userPassword
	userPassword="${userPassword:=.   }"

	echo -e "\n${BLUE}Creating User / Đang tạo User${NC}"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username" UserShell "/bin/zsh"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username" RealName "$fullName"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username" UniqueID "$defaultUID"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username" PrimaryGroupID "20"
	mkdir "$dataVolumePath/Users/$username"
	dscl -f "$dscl_path" localhost -create "$localUserDirPath/$username" NFSHomeDirectory "/Users/$username"
	dscl -f "$dscl_path" localhost -passwd "$localUserDirPath/$username" "$userPassword"
	dscl -f "$dscl_path" localhost -append "/Local/Default/Groups/admin" GroupMembership "$username"
	echo -e "${GREEN}User created${NC}\n"
else
	echo -e "${BLUE}User already created${NC}\n"
