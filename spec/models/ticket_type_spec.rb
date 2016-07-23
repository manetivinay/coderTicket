require 'rails_helper'

RSpec.describe TicketType, type: :model do
  let(:event) { Event.create({   name: 'Việt Nam Thử Thách Chiến Thắng',
                                 starts_at: DateTime.parse('Fri, 11 Mar 2016 7:00 AM+0700'),
                                 ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
                                 venue: Event.find_by(venue_id: '1'),
                                 category: Category.find_by(name: 'Everything Else'),
                                 hero_image_url: 'https://az810747.vo.msecnd.net/eventcover/2015/10/25/C6A1A5.jpg?w=1040&maxheight=400&mode=crop&anchor=topcenter',
                                 extended_html_description: <<-DESC
                                 <p style="text-align:center"><span style="font-size:20px">VIỆT NAM THỬ THÁCH CHIẾN THẮNG 2016</span></p>
                                                                      <p style="text-align:center"><span style="font-size:20px">Giải đua xe đạp địa hình 11-13/03/2016</span></p>
                                                                      <p style="text-align:center"><span style="font-size:16px"><span style="font-family:arial,helvetica,sans-serif">Việt Nam Th</span>ử Thách Chiến Thắng là giải đua xe đạp địa hình được tổ chức như một sự tri ân, và cũng nhằm thỏa mãn lòng đam mẹ của những người yêu xe đạp địa hình nói chung, cũng như cho những ai đóng góp vào môn thể thao đua xe đạp tại thành phố Hồ Chí Minh. Cuộc đua diễn ra ở thành phố cao nguyên hùng vĩ Đà Lạt, với độ cao 1,500m (4,900ft) so với mặt nước biển. Đến với đường đua này ngoài việc tận hưởng cảnh quan nơi đây, bạn còn có cơ hội biết thêm về nền văn hóa của thành phố này. </span></p>
                                                                      <p style="text-align:center"><span style="font-size:16px">Hãy cùng với hơn 350 tay đua trải nghiệm 04 lộ trình đua tuyệt vời diễn ra trong 03 ngày tại Đà Lạt và bạn sẽ có những kỉ niệm không bao giờ quên!</span></p>
                                                                      <p style="text-align:center"><span style="font-size:16px">Để biết thêm thông tin chi tiết và tạo thêm hứng khởi cho cuộc đua 2016, vui lòng ghé thăm trang web</span></p>
                                                                      <p style="text-align:center"><span style="font-size:16px"><strong><span style="background-color:transparent; color:rgb(0, 0, 0)">www.vietnamvictorychallenge.com. </span></strong></span></p>
                                 DESC
                             }) }
  let(:ticket_type) { TicketType.new }

  describe '#validates_inclusion_of' do
    it 'should belongs to event ' do
      expect(event.save).to eq false
      expect(event.errors.full_messages).to include("Venue can't be blank", "Category can't be blank")
    end
  end

  describe '#validate_presence_of_event' do
    it 'event should be present' do
      event.venue_id = nil
      event.save
      expect(event.errors.full_messages).to include("Venue can't be blank", "Category can't be blank")
    end
  end
end
