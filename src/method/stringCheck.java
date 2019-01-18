package method;

public class stringCheck {
	
	public static int check (String value) {
		int out = 0; 
		if (value.isEmpty()) {
			out = 0;
		}else if (value.chars().allMatch(Character::isLetter)){
			out = 1;
		}
		return out;
	}

}