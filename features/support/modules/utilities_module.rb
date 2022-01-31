module UtilitiesModule
  def cal_date no_of_days
    (Time.now + 24 * 60 * 60 * no_of_days).strftime("%-d %B %Y")
  end

  def verify_both_results_are_same? exp_val, act_val
    fail "Expected #{exp_val} is NOT same as Actual #{act_val}" unless exp_val == act_val
  end

  def verify_expected_value_exists? exp_val, act_val
    fail "Expected value #{exp_val} does not exist in Actual value #{act_val}" unless act_val.include? exp_val
  end

  # when you open applications, sometime you see two buttons, you may need to scroll up/down the page. for that we will use the following method.
  #  execute_script method will call other languages to like java.
  # window.scrollTo(0,0) is java script. execute_script("window.scrollTo(0,0)") means, your executing another scripting language.

  def scroll_to_top_of_page
    puts 'scrolled to top'
    @browser.execute_script("window.scrollTo(0,0)") #  scroll to top of page
  end

  #  sometime, when you click on something it opens in a diff. tab.
  # so you can do that with tab's name. Every tab has a name.
  # or you can say give me the windows on this browser. depending the browsers opened on that page it will give you count.
  # or you can say focus on the last window.
  # before you say switch to tab, make sure the tab is opened
  def switch_to_tab(tab_name)
    wait_until { @browser.windows.map(&:titile).include? tab_name }
    @browser.windows.find { |tab| tab.title == tab_name }.use
    #  you can also say
    # @browser.windows.last.use
    # @browser.windows[0].use
    # @browser.windows.first.use
  end

  def switch_to_new_tab
    @browser.windows.last.use
  end

  #  closes all but the currently active browser tab
  def close_other_tabs
    @browser.windows.reject { |window| window == browser.window }.each do |window|
      window.close
      @browser.alert.ok if @browser.alert.exists?
    # pop ups are nothing but alerts
    end
  end
end