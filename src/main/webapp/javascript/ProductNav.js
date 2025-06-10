function changeTab(clickedTab) {
  // Remove active class from all tabs
  const tabs = document.querySelectorAll('.nav-link1');
  tabs.forEach((tab) => tab.classList.remove('active'));

  // Add active class to the clicked tab
  clickedTab.classList.add('active');
}
 function changeTab1(tabId) {
  // Get all tab buttons and remove "active" class from them
  const tabButtons = document.querySelectorAll(".tab-link");
  tabButtons.forEach((button) => {
    button.classList.remove("active");
  });

  // Add "active" class to the clicked tab button
  document.querySelector(`[onclick="changeTab1('${tabId}')"]`).classList.add("active");

  // Hide all tab content
  const tabContents = document.querySelectorAll(".tab-content");
  tabContents.forEach((content) => {
    content.classList.remove("active");
  });

  // Show the content corresponding to the clicked tab
  document.getElementById(tabId).classList.add("active");
}