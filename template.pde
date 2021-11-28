int number_of_image = 0;
StringBuilder image_buff    = new StringBuilder();
StringBuilder nowImage_buff = new StringBuilder();
String nowImageFolderName = "";

void makeImageFolder() {
    int year = year();
    int month = month();
    int day = day();
    int hour = hour();
    int minute = minute();
    int second = second();
    // HashMap<String, Integer> date_map = new HashMap<String, Integer>();
    // date_map.put("year", 4);
    // date_map.put("month", 2);
    // date_map.put("day", 2);
    // date_map.put("hour", 2);
    // date_map.put("minute", 2);
    // date_map.put("second", 2);
    // for (HashMap.Entry<String, Integer> entry : date_map.entrySet()) {
    //     println(String.format("%0" + entry.getValue() + "d", 1));
    // }
    ArrayList<Integer> date_list       = new ArrayList<Integer>(); // year, month, day, hour, minute, second
    ArrayList<Integer> date_digit_list = new ArrayList<Integer>(); // year, month, day, hour, minute, second
    date_list.add(year);
    date_list.add(month);
    date_list.add(day);
    date_list.add(hour);
    date_list.add(minute);
    date_list.add(second);
    date_digit_list.add(4);
    date_digit_list.add(2);
    date_digit_list.add(2);
    date_digit_list.add(2);
    date_digit_list.add(2);
    date_digit_list.add(2);
    nowImage_buff.append("image_");
    for (int i = 0; i < date_list.size(); i++) {
        nowImage_buff.append(String.format("%0" + date_digit_list.get(i) + "d", date_list.get(i)));
    }
    nowImage_buff.append("/saveimage_");
    nowImageFolderName = nowImage_buff.toString();
}

void makeImage() {
    number_of_image++;
    image_buff.delete(0, image_buff.length());
    image_buff.append(nowImageFolderName);
    image_buff.append(String.format("%03d", number_of_image));
    image_buff.append(".jpg");
    save(image_buff.toString());
}

void setup() {
    size(1280,720);
    frameRate(20);

    makeImageFolder();
}

void draw() {
    background(0);
    ellipse(width/2, height/2, mouseX, mouseY);
}

void keyPressed() {
    if (key == 's') {
        makeImage();
    }
}

