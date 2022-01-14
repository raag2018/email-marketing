        <!--MODAL-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		    <div class="modal-dialog modal-smll" role="document">
		        <div class="modal-content">
		            <div class="modal-header bg-primary text-center">
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		                <h2 class="modal-title" id="myModalLabel">Subscribe to our Newsletter.</h2>
		                <p>We promise we will not spam you.</p>
		            </div>
		            <div class="modal-body">
		                <div class="row">
		                    <form action="#">
		                        <div class="form-group col-md-12">
		                        <div class="input-group">
		                            <span class="input-group-addon">@</span>
		                            <input type="email" class="form-control input-lg"  placeholder="Your email here">
		                        </div>
		                    </div>
		                     <div class="form-group col-md-12">
		                        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Subscribe">
		                    </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
        <!-- FOOTER -->
		<div class="footer-section">
				<div class="footer-section-bg-graphics">
					<img src="../public/images/footer-section-bg.png">
				</div>
                <!-- Footer Column 1 -->
				<div class="container footer-container">
					<!-- div class="col-lg-3 col-md-6 footer-logo">
						<img src="../public/images/logo_footer.png">
						<p class="footer-susection-text">A beautiful landing page template by Codefest.</p>
					</div -->
					<!-- div class="col-lg-3 col-md-6 footer-subsection">
						<div class="footer-subsection-2-1">
							<h3 class="footer-subsection-title">About</h3>
							<p class="footer-subsection-text">We like to do business at Codelander HQ to our clients' satisfaction.</p>
						</div>
					</div -->
                    <!-- Footer Column 2 -->
					<!-- div class="col-lg-3 col-md-6 footer-subsection">
						<h3 class="footer-subsection-title">Contact Us</h3>
						<ul class="footer-subsection-list">
							<li>123 Business Centre<br>London SW1A 1AA</li>
							<li>0123456789</li>
							<li>mail@domain.com</li>
						</ul>	
					</div -->
                    <!-- Footer Column 3 -->
					<div class="col-lg-3 col-md-6 footer-subsection">
						<div class="footer-subsection-2-2">
							<h3 class="footer-subsection-title">Socials</h3>
							<div class="footer-social-media-icons-section">
								<a href="#top" class="footer-social-media-icon"><i class="fa fa-twitter"></i></a> 
								<a href="#top" class="footer-social-media-icon"><i class="fa fa-instagram"></i></a>
								<a href="#top" class="footer-social-media-icon"><i class="fa fa-facebook"></i></a>
								<a href="#top" class="footer-social-media-icon"><i class="fa fa-linkedin"></i></a>
							</div>
						</div>
					</div>
				</div>
        <!-- FOOTER CREDITS -->
				<div class="container footer-credits">
					<p>&copy; 2020 <a href="https://www.codefest.co.uk" target="_blank" title="Codefest">Codefest</a>&trade;. All Rights Reserved.</p>
				</div>
		</div>
		</div>

	<!-- FOOTER SCRIPTS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="../public/js/owl/owl.carousel.js"></script>
	<script src="../public/js/owl/owl.carousel.js"></script>
	<script src="../public/js/accordian.js"></script>
  	<!-- Header scroll -->
		<script type="text/javascript">
				$(window).scroll(function() {
				    if ($(this).scrollTop() > 20) {
				      $('#navbar').addClass('header-scrolled');
				    } else {
				      $('#navbar').removeClass('header-scrolled');
				    }
				  });		
		</script>
		<script>
			$(document).ready(function(){
			  $(".owl-carousel").owlCarousel({
			  	items:4,
			  	loop:true,
			  	nav:true,
			  	autoplay:true,
			    autoplayTimeout:2000,
			    autoplayHoverPause:true,
			    responsiveClass:true,
			    responsive:{
			        0:{
			            items:1
			        },
			        600:{
			            items:3
			        },
			        1000:{
			            items:4
			        }
			    }
			  });
			});
	    </script>
	</body>
</html>