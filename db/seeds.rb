{
  "holiday" => "假日",
  "sick leave" => "病假",
  "public holiday" => "公众假日",
  "compensation" => "补假"
}.each do |en, cn|
  type = AbsenceType.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { type.name = cn }
  type.save
end

{
  "pending" => "待定",
  "approved" => "已批准",
  "rejected" => "已拒绝",
  "cancelled" => "已取消"
}.each do |en, cn|
  type = AbsenceStatus.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { type.name = cn }
  type.save
end
