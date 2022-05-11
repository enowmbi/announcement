class NotificationQuery
  attr_accessor :base_query
  def initialize(base_query = Notification.all, search_params)
    @base_query = base_query
    @search_params = search_params
    @id_or_title = params[:id_or_title]
    @activity = params[:activity] || true
    @start_date = params[:start_date] || Date.current
    @end_date = params[:end_date] || Date.current
  end

  def call
    @base_query
      .where(by_activity)
      .where(by_id_or_title)
      .where(between_start_and_end_dates)
  end

  def by_id_or_title
    ["id like :id_or_title OR title ILIKE :id_or_title", id_or_title: @id_or_title ]
  end

  def by_activity
    {active: @activity}
  end

  def between_start_and_end_dates
    {created_at: @start_date .. @end_date}
  end
end
