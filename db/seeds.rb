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
  status = AbsenceStatus.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { status.name = cn }
  status.save
end

{
  "admin" => "管理员",
  "manager" => "经理",
  "employee" => "员工"
}.each do |en, cn|
  role = UserRole.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { role.name = cn }
  role.save
end

{
  "Marketing" => "市场",
  "Human Resources" => "人力资源",
  "Financial" => "财务",
  "Purchasing" => "采购",
  "Sales" => "销售",
  "IT" => "技术",
  "Inventory" => "仓库",
  "Staff" => "员工",
  "Customer Service" => "客户服务"
}.each do |en, cn|
  department = Department.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { department.name = cn }
  department.save
end

{
  "male" => "男性",
  "female" => "女性"
}.each do |en, cn|
  gender = Gender.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { gender.name = cn }
  gender.save
end

{
  "In progress" => "进行中",
  "Finished" => "已完成"
}.each do |en, cn|
  status = ProjectStatus.find_or_initialize_by(:name => en)
  Globalize.with_locale(:"zh-CN") { status.name = cn }
  status.save
end
