package person;

public class PersonDTO {
	private String id; 			// 아이디, 중복 안됨, 레코드를 구분하는 컬럼
	private String passwd; 		// 패스워드, 영숫자 조합
	private String name;		// 성명, 한글 10자 저장 가능
	private String phone; 		// 전화번호
	private String email;	 	// 전자우편 주소, 중복 안됨 -> UNIQUE //pk와 마찬가지로 중복될수없지만 다른점은
								// pk는 인덱스값이있다.
	private String zipcode;		// 우편번호, 101-101
	private String address1;	// 주소 1
	private String address2;	// 주소 2
	private String mdate;		// 가입일
	private String filename;	// 회원 사진
	private String grade;	 	//일반회원: H, 정지: Y, 손님:Z 
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	
	

}
