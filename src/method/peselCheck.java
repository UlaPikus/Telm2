package method;

public class peselCheck {

	public static int check(String pesel) {
		byte peselArray[] = new byte[11];
		int out = 0;
		if (pesel.length() == 11) {
			if (pesel.chars().allMatch(Character::isDigit)) {
				for (int i = 0; i<11; i++) {
					peselArray[i] = Byte.parseByte(pesel.substring(i, i+1));
				}
				int sum = 	1*peselArray[0]+
							3 * peselArray[1] +
							7 * peselArray[2] +
							9 * peselArray[3] +
							1 * peselArray[4] +
							3 * peselArray[5] +
							7 * peselArray[6] +
							9 * peselArray[7] +
							1 * peselArray[8] +
							3 * peselArray[9];
				sum %= 10;
				sum = 10 - sum;
				sum %= 10;
				if (sum == peselArray[10]) {
					out = 1;
				}
			}
		}
		return out;
	}

}
