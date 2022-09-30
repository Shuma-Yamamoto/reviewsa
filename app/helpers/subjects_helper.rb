module SubjectsHelper
  SUBJECTS = [
    { subject_id: [1], subject: "英語" },
    { subject_id: [8], subject: "数学" },
    { subject_id: [9], subject: "現代文" },
    { subject_id: [10], subject: "古文" },
    { subject_id: [11], subject: "漢文" },
    { subject_id: [13], subject: "物理" },
    { subject_id: [14], subject: "化学" },
    { subject_id: [15], subject: "生物" },
    { subject_id: [16], subject: "地学" },
    { subject_id: [17], subject: "日本史" },
    { subject_id: [18], subject: "世界史" },
    { subject_id: [19], subject: "地理" },
    { subject_id: [20], subject: "公民" },
    { subject_id: [21], subject: "小論文" },
  ]

  def get_subject(subject_id)
    @subject = SUBJECTS&.find{|hash| hash[:subject_id].include?(subject_id) }
    @subject[:subject] unless @subject.nil?
  end
end
